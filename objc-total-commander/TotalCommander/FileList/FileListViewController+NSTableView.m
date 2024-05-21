#import "FileListViewController+NSTableView.h"
#import "FileListViewController+NSTextFieldDelegate.h"
#import "TextCellView.h"

@implementation FileListViewController (NSTableViewDelegate)

- (void)setupTableView {
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.responderDelegate = self;
}

- (NSView *)tableView:(NSTableView *)tableView viewForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row {
    NSString *identifier = tableColumn.identifier;
    if([identifier isEqualToString:@"name"]) {
        TextCellView* view = [tableView makeViewWithIdentifier:identifier owner:self];
        if(view == nil) {
            view = [TextCellView new];
            view.identifier = identifier;
        }
        view.textField.stringValue = self.files[row].name;
        view.textField.delegate = self;
        return view;
    } else if([tableColumn.identifier isEqualToString:@"icon"]){
        return nil;
    }
    
    return nil;
}

- (void)tableViewSelectionDidChange:(NSNotification *)notification {
    NSIndexSet* indexes = self.tableView.selectedRowIndexes;
    NSMutableArray* selectedFileIDs = [NSMutableArray new];
    [indexes enumerateIndexesUsingBlock:^(NSUInteger idx, BOOL * _Nonnull stop) {
        [selectedFileIDs addObject:self.files[idx].uuid];
    }];

    self.selectedFileIDs = selectedFileIDs;
    [self updateAvailableFileActions];
}

- (BOOL)tableView:(NSTableView *)tableView shouldSelectRow:(NSInteger)row {
    return YES;
}

- (NSInteger)numberOfRowsInTableView:(NSTableView *)tableView {
    return self.files.count;
}

- (void)tableViewBecomeFirstResponder { 
    [self updateAvailableFileActions];
}

- (void)tableViewResignFirstResponder { 
    [self updateAvailableFileActions];
}

@end
