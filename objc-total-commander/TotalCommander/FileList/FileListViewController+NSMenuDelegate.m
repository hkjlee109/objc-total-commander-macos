#import "FileListViewController+NSMenuDelegate.h"

@implementation FileListViewController (NSMenuDelegate)

- (void)setupMenuDelegate {
    self.contextMenu.delegate = self;
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

- (void)menuNeedsUpdate:(NSMenu *)menu {
    FileActionFlags actions = 0;
    NSUInteger selectCount = self.tableView.selectedRowIndexes.count;
    if(selectCount > 0) {
        actions |= FileActionFlagShowInFinder;
        actions |= FileActionFlagDelete;
        if(selectCount == 1) {
            actions |= FileActionFlagView;
            actions |= FileActionFlagRename;
        }
    }
    self.contextMenu.availableFileActions = actions;
}

@end
