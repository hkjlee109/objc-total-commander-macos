#import "FileContextMenu.h"

@implementation FileContextMenu

- (id)init {
    self = [super init];
    if(self) {
        [self setup];
    }
    return self;
}

- (void)setup {
    NSMenuItem* show = [NSMenuItem new];
    show.title = @"Show in Finder";
    show.enabled = YES;
    show.action = @selector(processAction:);
    show.target = self;
    show.tag = FileActionFlagShowInFinder;
    show.keyEquivalent = @"O";
    show.keyEquivalentModifierMask = NSEventModifierFlagOption | NSEventModifierFlagCommand;
    [self addItem:show];
    
    NSMenuItem* rename = [NSMenuItem new];
    rename.title = @"Rename";
    rename.enabled = YES;
    rename.action = @selector(processAction:);
    rename.target = self;
    rename.tag = FileActionFlagRename;
    rename.keyEquivalent = @"\uF709"; // NSF6FunctionKey
    rename.keyEquivalentModifierMask = 0;
    [self addItem:rename];
    
    NSMenuItem* delete = [NSMenuItem new];
    delete.title = @"Delete";
    delete.enabled = YES;
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

@end
