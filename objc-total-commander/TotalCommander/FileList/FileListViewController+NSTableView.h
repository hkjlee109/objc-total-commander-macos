#import "FileListViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface FileListViewController (NSTableView)
    <NSTableViewDelegate, NSTableViewDataSource, FileListTableViewResponderDelegate>

- (void)setupTableView;

@end

NS_ASSUME_NONNULL_END
