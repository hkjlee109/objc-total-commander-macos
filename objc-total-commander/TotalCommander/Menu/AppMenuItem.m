#import "AppMenuItem.h"

@implementation AppMenuItem

- (instancetype)init
{
    self = [super init];
    if(self) {
        [self setup];
    }
    return self;
}

- (void)setup {
    self.submenu = [[NSMenu alloc] initWithTitle:@""];
}

@end
