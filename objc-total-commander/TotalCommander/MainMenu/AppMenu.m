#import "AppMenu.h"

@implementation AppMenu

- (instancetype)init {
    self = [super init];
    if(self) {
        self.autoenablesItems = NO;
        [self setup];
    }
    return self;
}

- (void)setup {
    [self removeAllItems];
}

@end
