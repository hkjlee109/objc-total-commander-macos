#import "FileListViewController+NSTableViewDelegate.h"
#import "TextCellView.h"

@implementation FileListViewController (NSTableViewDelegate)

- (void)setupTableViewDelegate {
    self.tableView.delegate = self;
}

- (NSView *)tableView:(NSTableView *)tableView viewForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row {
    NSString *identifier = tableColumn.identifier;
    if([identifier isEqualToString:@"name"]) {
        TextCellView* view = [tableView makeViewWithIdentifier:identifier owner:self];
        if(view == nil) {
            view = [TextCellView new];
            view.identifier = identifier;
        }
        view.name = self.files[row].name;
        return view;
    } else if([tableColumn.identifier isEqualToString:@"icon"]){
        return nil;
    }
    
    return nil;
}

- (void)tableViewSelectionDidChange:(NSNotification *)notification {
//    NSIndexSet* indexes = self.tableView.selectedRowIndexes;
}

- (BOOL)tableView:(NSTableView *)tableView shouldSelectRow:(NSInteger)row {
    return YES;
}

@end
