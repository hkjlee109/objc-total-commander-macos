#import "FileListTableView.h"

@implementation FileListTableView

- (BOOL)becomeFirstResponder {
    [self.responderDelegate tableViewBecomeFirstResponder];
    return YES;
}

- (BOOL)resignFirstResponder {
    [self.responderDelegate tableViewResignFirstResponder];
    return YES;
}
@end
