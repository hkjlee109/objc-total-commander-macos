#import "FileListViewController+FileContextMenuItemDelegate.h"

@implementation FileListViewController (FileContextMenuItemDelegate)

- (void)setupFileContextMenuItemDelegate {
    self.contextMenu.itemDelegate = self;
}

- (void)didSelectFileContextMenuItem:(FileActionFlags)action {
    switch(action) {
        case FileActionFlagShowInFinder:
            break;
        case FileActionFlagRename:
            [self renameSelected];
            break;
        case FileActionFlagDelete:
            break;
        default:
            break;
    }
}

@end
