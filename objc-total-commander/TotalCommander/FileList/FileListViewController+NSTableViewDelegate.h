#import "FileListViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface FileListViewController (NSTableViewDelegate)
    <NSTableViewDelegate, FileListTableViewResponderDelegate>

- (void)setupTableViewDelegate;

@end

NS_ASSUME_NONNULL_END
