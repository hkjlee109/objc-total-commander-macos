#import "FileMenuItem.h"

@implementation FileMenuItem

- (instancetype)init
{
    self = [super init];
    if(self) {
        [self setup];
    }
    return self;
}

- (void)setup {
    self.submenu = [[NSMenu alloc] initWithTitle:@"File"];
    
    NSMenuItem* view = [NSMenuItem new];
    view.title = @"View";
    view.target = self;
    view.enabled = YES;
    view.action = @selector(handleView:);
    view.keyEquivalent = @"\uF706"; // NSF3FunctionKey
    view.keyEquivalentModifierMask = 0;
    [self.submenu addItem:view];
    
    NSMenuItem* edit = [NSMenuItem new];
    edit.title = @"Edit";
    edit.target = self;
    edit.enabled = YES;
    edit.action = @selector(handleEdit:);
    edit.keyEquivalent = @"\uF707"; // NSF4FunctionKey
    edit.keyEquivalentModifierMask = 0;
    [self.submenu addItem:edit];
    
    NSMenuItem* rename = [NSMenuItem new];
    rename.title = @"Rename";
    rename.target = self;
    rename.enabled = YES;
    rename.action = @selector(handleRename:);
    rename.keyEquivalent = @"\uF709"; // NSF6FunctionKey
    rename.keyEquivalentModifierMask = 0;
    [self.submenu addItem:rename];
    
    NSMenuItem* newFolder = [NSMenuItem new];
    newFolder.title = @"New Folder";
    newFolder.target = self;
    newFolder.enabled = YES;
    newFolder.action = @selector(handleNewFolder:);
    newFolder.keyEquivalent = @"\uF70A"; // NSF7FunctionKey
    newFolder.keyEquivalentModifierMask = 0;
    [self.submenu addItem:newFolder];
    
    NSMenuItem* delete = [NSMenuItem new];
    delete.title = @"Delete";
    delete.target = self;
    delete.enabled = YES;
    delete.action = @selector(handleRename:);
    delete.keyEquivalent = @"\uF70B"; // NSF8FunctionKey
    delete.keyEquivalentModifierMask = 0;
    [self.submenu addItem:delete];
}

- (void)handleView:(NSMenuItem*)sender {
    [self.delegate didTapView];
}

- (void)handleEdit:(NSMenuItem*)sender {
    [_delegate didTapEdit];
}

- (void)handleRename:(NSMenuItem*)sender {
    [_delegate didTapRename];
}

- (void)handleNewFolder:(NSMenuItem*)sender {
    [_delegate didTapNewFolder];
}

- (void)handleDelete:(NSMenuItem*)sender {
    [_delegate didTapDelete];
}

@end
