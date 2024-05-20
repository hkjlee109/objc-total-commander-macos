#import "FileViewData.h"

@implementation FileViewData

- (id)initWithFileData:(FileData*)fileData {
    self = [super init];
    if(self) {
        _uuid = fileData.uuid;
        _name = fileData.name;
    }
    return self;
}

@end
