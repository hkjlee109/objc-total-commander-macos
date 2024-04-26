#import "FileListViewController+NSTableViewDataSource.h"

@implementation FileListViewController (NSTableViewDataSource)

- (void)setupTableViewDataSource {
    self.tableView.dataSource = self;
}

- (NSInteger)numberOfRowsInTableView:(NSTableView *)tableView {
    return self.files.count;
}

@end
