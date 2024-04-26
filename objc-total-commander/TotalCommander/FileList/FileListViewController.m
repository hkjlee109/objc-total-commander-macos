#import "FileListViewController.h"
#import "FileListViewController+NSTableViewDelegate.h"
#import "FileListViewController+NSTableViewDataSource.h"
#import "TextCellView.h"

@implementation FileListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSMutableArray* items = [NSMutableArray new];
    [items addObject:[[FileViewData alloc] initWithFileData]];
    [items addObject:[[FileViewData alloc] initWithFileData]];
    _files = [items copy];
    
    _tableView = [NSTableView new];
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

- (void)keyDown:(NSEvent *)event {
    if ([[event characters] characterAtIndex:0] == NSTabCharacter) {
        if (([event modifierFlags] & NSEventModifierFlagShift) != NSEventModifierFlagShift) {
        }
    }
    else {
        [super keyDown:event];
    }
}

@end
