#import "FileListViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface FileListViewController (NSTableViewDataSource) <NSTableViewDataSource>

- (void)setupTableViewDataSource;

@end

NS_ASSUME_NONNULL_END
