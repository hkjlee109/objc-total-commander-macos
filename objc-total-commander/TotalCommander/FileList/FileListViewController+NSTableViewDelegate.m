#import "FileListViewController+NSTableViewDelegate.h"
#import "FileListViewController+NSTextFieldDelegate.h"
#import "TextCellView.h"

@implementation FileListViewController (NSTableViewDelegate)

- (void)setupTableViewDelegate {
    self.tableView.delegate = self;
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
        view.nameTextField.stringValue = self.files[row].name;
        view.nameTextField.delegate = self;
        return view;
    } else if([tableColumn.identifier isEqualToString:@"icon"]){
        return nil;
    }
    
    return nil;
}

- (void)tableViewSelectionDidChange:(NSNotification *)notification {
    NSIndexSet* indexes = self.tableView.selectedRowIndexes;
    NSMutableSet<NSString*>* selectedFiles = [NSMutableSet new];
    [indexes enumerateIndexesUsingBlock:^(NSUInteger idx, BOOL * _Nonnull stop) {
        [selectedFiles addObject:self.files[idx].name];
    }];
    self.selectedFiles = selectedFiles;
    [self updateAvailableFileActions];
}

- (BOOL)tableView:(NSTableView *)tableView shouldSelectRow:(NSInteger)row {
    return YES;
}

- (void)tableViewBecomeFirstResponder { 
    [self updateAvailableFileActions];
}

- (void)tableViewResignFirstResponder { 
    [self updateAvailableFileActions];
}

@end
