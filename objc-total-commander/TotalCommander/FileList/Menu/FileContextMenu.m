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
    show.action = @selector(handleAction:);
    show.keyEquivalent = @"\uF706"; // NSF3FunctionKey
    show.keyEquivalentModifierMask = 0;
    [self addItem:show];
    
    NSMenuItem* rename = [NSMenuItem new];
    rename.title = @"Rename";
    rename.enabled = YES;
    rename.action = @selector(handleAction:);
    rename.keyEquivalent = @"\uF706"; // NSF3FunctionKey
    rename.keyEquivalentModifierMask = 0;
    [self addItem:rename];
}

@end
