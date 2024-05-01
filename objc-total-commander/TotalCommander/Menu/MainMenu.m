#import "MainMenu.h"

@implementation MainMenu

- (id)init {
    self = [super init];
    if(self) {
        self.appMenuItem = [AppMenuItem new];
        self.fileMenuItem = [FileMenuItem new];
        
        [self addItem:self.appMenuItem];
        [self addItem:self.fileMenuItem];
    }
    return self;
}

- (NSMenuItem*)makeAppMenu {
    NSMenuItem* menuItem = [NSMenuItem new];
    menuItem.submenu = [[NSMenu alloc] initWithTitle:@""];
    return menuItem;
}

@end
