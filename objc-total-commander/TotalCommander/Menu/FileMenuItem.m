#import "FileMenuItem.h"

@interface FileMenuItem() <NSMenuDelegate>

@end

@implementation FileMenuItem

- (instancetype)init {
    self = [super init];
    if(self) {
        self.submenu = [[NSMenu alloc] initWithTitle:@"File"];
        self.submenu.delegate = self;
        self.submenu.autoenablesItems = NO;
        [self setup];
    }
    return self;
}

- (void)setup {
    [self.submenu removeAllItems];
    
    NSMenuItem* view = [NSMenuItem new];
    view.title = @"View";
    view.target = self;
    view.enabled = _availableFileActions & FileActionFlagView;
    view.action = @selector(handleAction:);
    view.tag = FileActionFlagView;
    view.keyEquivalent = @"\uF706"; // NSF3FunctionKey
    view.keyEquivalentModifierMask = 0;
    [self.submenu addItem:view];
    
    NSMenuItem* edit = [NSMenuItem new];
    edit.title = @"Edit";
    edit.target = self;
    edit.enabled = _availableFileActions & FileActionFlagEdit;
    edit.action = @selector(handleAction:);
    edit.tag = FileActionFlagEdit;
    edit.keyEquivalent = @"\uF707"; // NSF4FunctionKey
    edit.keyEquivalentModifierMask = 0;
    [self.submenu addItem:edit];
    
    NSMenuItem* rename = [NSMenuItem new];
    rename.title = @"Rename";
    rename.target = self;
    rename.enabled = _availableFileActions & FileActionFlagRename;
    rename.action = @selector(handleAction:);
    rename.tag = FileActionFlagRename;
    rename.keyEquivalent = @"\uF709"; // NSF6FunctionKey
    rename.keyEquivalentModifierMask = 0;
    [self.submenu addItem:rename];
    
    NSMenuItem* newFolder = [NSMenuItem new];
    newFolder.title = @"New Folder";
    newFolder.target = self;
    newFolder.enabled = _availableFileActions & FileActionFlagNewFolder;
    newFolder.action = @selector(handleAction:);
    newFolder.tag = FileActionFlagNewFolder;
    newFolder.keyEquivalent = @"\uF70A"; // NSF7FunctionKey
    newFolder.keyEquivalentModifierMask = 0;
    [self.submenu addItem:newFolder];
    
    NSMenuItem* delete = [NSMenuItem new];
    delete.title = @"Delete";
    delete.target = self;
    delete.enabled = _availableFileActions & FileActionFlagDelete;
    delete.action = @selector(handleAction:);
    delete.tag = FileActionFlagDelete;
    delete.keyEquivalent = @"\uF70B"; // NSF8FunctionKey
    delete.keyEquivalentModifierMask = 0;
    [self.submenu addItem:delete];
}

- (void)menuWillOpen:(NSMenu *)menu {
    [self setup];
}

- (void)handleAction:(NSMenuItem*)sender {
    [self.delegate didSelectFileMenu:sender.tag];
}

@end
