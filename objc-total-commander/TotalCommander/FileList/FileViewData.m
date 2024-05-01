#import "FileViewData.h"

@implementation FileViewData

- (id)initWithFileData:(FileData*)fileData {
    self = [super init];
    if(self) {
        _name = fileData.name;
    }
    return self;
}

@end
