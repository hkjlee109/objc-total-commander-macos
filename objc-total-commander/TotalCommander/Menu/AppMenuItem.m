#import "AppMenuItem.h"

@implementation AppMenuItem

- (instancetype)init
{
    self = [super init];
    if(!self) {
        return nil;
    }
    [self setup];
    return self;
}

- (void)setup {
    self.submenu = [[NSMenu alloc] initWithTitle:@""];
}

@end
