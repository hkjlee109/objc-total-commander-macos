#import "FileContextMenu.h"
#import "FileListViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface FileListViewController (NSMenuDelegate)
    <NSMenuDelegate, FileContextMenuItemDelegate>

- (void)setupMenuDelegate;

@end

NS_ASSUME_NONNULL_END
