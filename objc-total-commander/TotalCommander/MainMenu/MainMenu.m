#import "MainMenu.h"

@implementation MainMenu

- (id)init {
    self = [super init];
    if(self) {
        self.appMenu = [AppMenu new];
        self.fileMenu = [FileMenu new];
        [self install:self.appMenu];
        [self install:self.fileMenu];
    }
    return self;
}

- (void)install:(NSMenu*)menu {
    NSMenuItem* menuItem = [NSMenuItem new];
    menuItem.submenu = menu;
    [self addItem:menuItem];
}

@end
