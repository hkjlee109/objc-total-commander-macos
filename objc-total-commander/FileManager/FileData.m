#import "FileData.h"

@implementation FileData

- (id)initWithData:(NSString*)name 
  modificationDate:(NSDate*)modificationDate
       isDirectory:(BOOL)isDirectory {
    self = [super init];
    if(self) {
        _name = name;
        _modificationDate = modificationDate;
        _isDirectory = isDirectory;
    }
    return self;
}

@end
