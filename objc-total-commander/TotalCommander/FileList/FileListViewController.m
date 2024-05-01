#import "FileListViewController.h"
#import "FileListViewController+NSTableViewDelegate.h"
#import "FileListViewController+NSTableViewDataSource.h"
#import "TextCellView.h"

@interface FileListViewController () {
}
@end

@implementation FileListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _tableView = [FileListTableView new];
    _tableView.allowsMultipleSelection = YES;

    _scrollView = [NSScrollView new];
    _scrollView.translatesAutoresizingMaskIntoConstraints = NO;
    _scrollView.documentView = _tableView;
    _scrollView.hasVerticalScroller = YES;
    [self.view addSubview:_scrollView];
    
    [_scrollView.topAnchor constraintEqualToAnchor:self.view.topAnchor].active = YES;
    [_scrollView.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor].active = YES;
    [_scrollView.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor].active = YES;
    [_scrollView.bottomAnchor constraintEqualToAnchor:self.view.bottomAnchor].active = YES;
    
    NSTableColumn* iconColumn = [[NSTableColumn alloc] initWithIdentifier:@"icon"];
    [iconColumn setTitle:@""];
    [iconColumn setWidth:15];

    NSTableColumn* nameColumn = [[NSTableColumn alloc] initWithIdentifier:@"name"];
    [nameColumn setTitle:@"Name"];
    
    [_tableView addTableColumn:iconColumn];
    [_tableView addTableColumn:nameColumn];
    
    [self setupTableViewDelegate];
    [self setupTableViewDataSource];
}

- (void)setFiles:(NSArray<FileViewData*>*)files {
    _files = files;
    [_tableView reloadData];
}

- (BOOL)isFocused {
    return (self.view.window.firstResponder == self.tableView)
        && (self.tableView.selectedRowIndexes.count > 0);
}

- (void)setFocus {
    [self.view.window makeFirstResponder:self.tableView];
    if(self.tableView.selectedRowIndexes.count == 0) {
        NSIndexSet *indexSet = [NSIndexSet indexSetWithIndex:0];
        [self.tableView selectRowIndexes:indexSet byExtendingSelection:NO];
    }
}

- (void)renameSelected {
    if(_selectedFiles.count != 1) { return; }
    NSInteger column = [_tableView columnWithIdentifier:@"name"];
    TextCellView* view = [_tableView viewAtColumn:column
                                              row:_tableView.selectedRow
                                  makeIfNecessary:NO];
    view.nameTextField.editable = YES;
    [self.view.window makeFirstResponder:view.nameTextField];
}

@end
