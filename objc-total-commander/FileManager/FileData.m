#import "FileData.h"

@implementation FileData

- (id)initWithData:(NSString*)name 
parentDirectoryURL:(NSURL*)parentDirectoryURL
  modificationDate:(NSDate*)modificationDate
       isDirectory:(BOOL)isDirectory {
    self = [super init];
    if(self) {
        _uuid = [[NSUUID UUID] UUIDString];
        _name = name;
        _parentDirectoryURL = parentDirectoryURL;
        _modificationDate = modificationDate;
        _isDirectory = isDirectory;
    }
    return self;
}

@end
