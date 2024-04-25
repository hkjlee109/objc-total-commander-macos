#import "FileListViewController.h"
#import "FileViewData.h"
#import "TextCellView.h"

@interface FileListViewController () <NSTableViewDelegate, NSTableViewDataSource> {
    NSTableView* _tableView;
    NSScrollView* _scrollView;
    NSArray<FileViewData*>* _files;
}
@end

@implementation FileListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSMutableArray* items = [NSMutableArray new];
    [items addObject:[[FileViewData alloc] initWithFileData]];
    [items addObject:[[FileViewData alloc] initWithFileData]];
    _files = [items copy];
    
    _tableView = [NSTableView new];
    _tableView.delegate = self;
    _tableView.dataSource = self;

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
}

- (NSInteger)numberOfRowsInTableView:(NSTableView *)tableView {
    return _files.count;
}

- (NSView *)tableView:(NSTableView *)tableView viewForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row {
    NSString *identifier = tableColumn.identifier;
    if([identifier isEqualToString:@"name"]) {
        TextCellView* view = [tableView makeViewWithIdentifier:identifier owner:self];
        if(view == nil) {
            view = [TextCellView new];
            view.identifier = identifier;
        }
        view.name = _files[row].name;
        return view;
    } else if([tableColumn.identifier isEqualToString:@"icon"]){
        return nil;
    }
    
    return nil;
}

- (void)tableViewSelectionDidChange:(NSNotification *)notification {
}

@end
