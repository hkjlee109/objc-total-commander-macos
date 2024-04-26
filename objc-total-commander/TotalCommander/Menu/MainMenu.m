#import "MainMenu.h"

@implementation MainMenu

- (id)init {
    self = [super init];
    if (!self) {
        return nil;
    }
    
    [self addItem:[self makeAppMenu]];
    [self addItem:[self makeFileMenu]];
    
    return self;
}

- (NSMenuItem*)makeAppMenu {
    NSMenuItem* menuItem = [NSMenuItem new];
    menuItem.submenu = [[NSMenu alloc] initWithTitle:@""];
    return menuItem;
}

- (NSMenuItem*)makeFileMenu {
    NSMenuItem* menuItem = [NSMenuItem new];
    menuItem.submenu = [[NSMenu alloc] initWithTitle:@"File"];
    
    NSMenuItem* rename = [NSMenuItem new];
    rename.title = @"Rename";
    rename.target = self;
    rename.enabled = YES;
    rename.action = @selector(handleRename:);
    rename.keyEquivalent = @"\uF709"; // NSF6FunctionKey
    rename.keyEquivalentModifierMask = 0;
    [menuItem.submenu addItem:rename];
    
    NSMenuItem* newFolder = [NSMenuItem new];
    newFolder.title = @"New Folder";
    newFolder.target = self;
    newFolder.enabled = YES;
    newFolder.action = @selector(handleNewFolder:);
    newFolder.keyEquivalent = @"\uF70A"; // NSF8FunctionKey
    newFolder.keyEquivalentModifierMask = 0;
    [menuItem.submenu addItem:newFolder];
    
    NSMenuItem* delete = [NSMenuItem new];
    delete.title = @"Delete";
    delete.target = self;
    delete.enabled = YES;
    delete.action = @selector(handleRename:);
    delete.keyEquivalent = @"\uF70B"; // NSF8FunctionKey
    delete.keyEquivalentModifierMask = 0;
    [menuItem.submenu addItem:delete];
    
    return menuItem;
}

- (void)handleRename:(NSMenuItem*)sender {

}

- (void)handleNewFolder:(NSMenuItem*)sender {

}

- (void)handleDelete:(NSMenuItem*)sender {

}

@end
