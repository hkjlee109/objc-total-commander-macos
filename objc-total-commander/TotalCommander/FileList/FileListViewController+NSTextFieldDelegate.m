#import "FileListViewController+NSTextFieldDelegate.h"

@implementation FileListViewController (NSTableViewDelegate)

- (void)controlTextDidBeginEditing:(NSNotification *)notf {
    NSLog(@"# controlTextDidBeginEditing");
}

- (void)controlTextDidEndEditing:(NSNotification *)obj {
    NSLog(@"# controlTextDidEndEditing");
}

@end
