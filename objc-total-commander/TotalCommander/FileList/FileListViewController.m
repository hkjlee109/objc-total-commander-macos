#import "FileListViewController.h"
#import "FileListViewController+NSFilePromiseProviderDelegate.h"
#import "FileListViewController+NSMenuDelegate.h"
#import "FileListViewController+NSTableView.h"

#import "TextCellView.h"

@interface FileListViewController ()

@end

@implementation FileListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _tableView = [FileListTableView new];
    _tableView.allowsMultipleSelection = YES;
    [_tableView setDraggingSourceOperationMask:NSDragOperationCopy forLocal:YES];
    [_tableView registerForDraggedTypes:@[NSFilesPromisePboardType, NSFilenamesPboardType]];
    
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

    _contextMenu = [FileContextMenu new];
    _tableView.menu = _contextMenu;
    
    [self setupTableView];
    [self setupMenuDelegate];
}

- (void)setFiles:(NSArray<FileViewData*>*)files {
    _files = files;
    [_tableView reloadData];
}

- (NSArray<NSString*>*)selectedFileIDs {
    if([self isFocused]) {
        return _selectedFileIDs;
    }
    return nil;
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
    
    [self updateAvailableFileActions];
}

- (void)updateAvailableFileActions {
    FileActionFlags actions = 0;
    NSUInteger selectCount = self.tableView.selectedRowIndexes.count;
    if(selectCount > 0) {
        actions |= FileActionFlagContextMenu;
        actions |= FileActionFlagNewFolder;
        actions |= FileActionFlagDelete;
        if(selectCount == 1) {
            actions |= FileActionFlagView;
            actions |= FileActionFlagRename;
        }
    }
    self.onAvailableFileActionsChange(actions);
}

- (void)renameSelected {
    if(!self.isFocused) { return; }
    
    if(_selectedFileIDs.count != 1) { return; }
    NSInteger column = [_tableView columnWithIdentifier:@"name"];
    TextCellView* view = [_tableView viewAtColumn:column
                                              row:_tableView.selectedRow
                                  makeIfNecessary:NO];
    view.textField.editable = YES;
    [self.view.window makeFirstResponder:view.textField];
}

- (void)showContextMenu {
    if(!self.isFocused) { return; }
    if(_tableView.selectedRow == -1) { return; }
    
    NSInteger column = [_tableView columnWithIdentifier:@"name"];
    TextCellView* cellView = [_tableView viewAtColumn:column
                                                  row:_tableView.selectedRow
                                      makeIfNecessary:NO];
    
    [_tableView.menu popUpMenuPositioningItem:[_tableView.menu itemAtIndex:0]
                                   atLocation:NSMakePoint(0, 0)
                                       inView:cellView];
}

- (id<NSPasteboardWriting>)tableView:(NSTableView *)tableView pasteboardWriterForRow:(NSInteger)row {
    NSFilePromiseProvider* provider = [[NSFilePromiseProvider alloc] initWithFileType:kUTTypeData delegate:self];
    provider.userInfo = @"tmp";
    return provider;
}

- (NSDragOperation)tableView:(NSTableView *)tableView validateDrop:(id<NSDraggingInfo>)info proposedRow:(NSInteger)row proposedDropOperation:(NSTableViewDropOperation)dropOperation {
    return NSDragOperationCopy;
}

- (BOOL)tableView:(NSTableView *)tableView writeRowsWithIndexes:(NSIndexSet *)rowIndexes toPasteboard:(NSPasteboard *)pboard {
    return YES;
}

- (BOOL)tableView:(NSTableView *)tableView acceptDrop:(id<NSDraggingInfo>)info row:(NSInteger)row dropOperation:(NSTableViewDropOperation)dropOperation {
    return YES;
}

- (void)tableView:(NSTableView *)tableView draggingSession:(NSDraggingSession *)session willBeginAtPoint:(NSPoint)screenPoint forRowIndexes:(NSIndexSet *)rowIndexes {
    NSLog(@"# draggingSession: willBeginAtPoint");
}

- (void)tableView:(NSTableView *)tableView draggingSession:(NSDraggingSession *)session endedAtPoint:(NSPoint)screenPoint operation:(NSDragOperation)operation {
    NSLog(@"# draggingSession: endedAtPoint");
}

@end
