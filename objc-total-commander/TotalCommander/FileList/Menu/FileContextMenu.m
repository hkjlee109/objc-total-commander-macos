#import "FileContextMenu.h"

@implementation FileContextMenu

- (id)init {
    self = [super init];
    if(self) {
        self.autoenablesItems = NO;
        [self setup];
    }
    return self;
}

- (void)setup {
    [self removeAllItems];
    
    NSMenuItem* show = [NSMenuItem new];
    show.title = @"Show in Finder";
    show.enabled = _availableFileActions & FileActionFlagShowInFinder;
    show.action = @selector(processAction:);
    show.target = self;
    show.tag = FileActionFlagShowInFinder;
    show.keyEquivalent = @"O";
    show.keyEquivalentModifierMask = NSEventModifierFlagOption | NSEventModifierFlagCommand;
    [self addItem:show];
    
    NSMenuItem* rename = [NSMenuItem new];
    rename.title = @"Rename";
    rename.enabled = _availableFileActions & FileActionFlagRename;
    rename.action = @selector(processAction:);
    rename.target = self;
    rename.tag = FileActionFlagRename;
    rename.keyEquivalent = @"\uF709"; // NSF6FunctionKey
    rename.keyEquivalentModifierMask = 0;
    [self addItem:rename];
    
    NSMenuItem* delete = [NSMenuItem new];
    delete.title = @"Delete";
    delete.enabled = _availableFileActions & FileActionFlagDelete;
    delete.action = @selector(processAction:);
    delete.target = self;
    delete.tag = FileActionFlagDelete;
    delete.keyEquivalent = @"\uF70B"; // NSF8FunctionKey
    delete.keyEquivalentModifierMask = 0;
    [self addItem:delete];
}

- (void)processAction:(NSMenuItem*)sender {
    [self.itemDelegate didSelectFileContextMenuItem:sender.tag];
}

- (void)setAvailableFileActions:(FileActionFlags)availableFileActions {
    if(_availableFileActions == availableFileActions) { return; }
    _availableFileActions = availableFileActions;
    [self setup];
}

@end
