#import "FileManager.h"

@implementation FileManager

- (NSArray*)getFileList:(NSString*)path {
    NSError* error;
    NSArray* urls = [[NSFileManager defaultManager]
        contentsOfDirectoryAtURL:[NSURL fileURLWithPath:path]
        includingPropertiesForKeys:@[
            NSURLIsDirectoryKey,
            NSURLIsSymbolicLinkKey,
            NSURLNameKey,
            NSURLFileSizeKey,
            NSURLContentModificationDateKey,
            NSURLLocalizedTypeDescriptionKey
        ]
        options:NSDirectoryEnumerationSkipsHiddenFiles
        error:&error];
    
    if(error) {
        NSLog(@"[ERROR] %@ %@", error, [error userInfo]);
        return nil;
    }
    
    NSMutableArray* files = [[NSMutableArray alloc] init];
    
    for(NSURL* url in urls) {
        NSString* name;
        [url getResourceValue:&name 
                       forKey:NSURLNameKey error:nil];
        
        NSDate* modificationDate;
        [url getResourceValue:&modificationDate 
                       forKey:NSURLContentModificationDateKey
                        error:nil];
        
        NSNumber* isDirectory;
        [url getResourceValue:&isDirectory 
                       forKey:NSURLIsDirectoryKey error:nil];
        
        FileData* data = [[FileData alloc] initWithData:name
                                       modificationDate:modificationDate
                                            isDirectory:isDirectory];
        
        [files addObject:data];
    }
    
    return files;
}

@end
