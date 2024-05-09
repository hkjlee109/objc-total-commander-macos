#import "FileContextMenu.h"
#import "FileListViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface FileListViewController (FileContextMenuItemDelegate) <FileContextMenuItemDelegate>

- (void)setupFileContextMenuItemDelegate;

@end

NS_ASSUME_NONNULL_END
