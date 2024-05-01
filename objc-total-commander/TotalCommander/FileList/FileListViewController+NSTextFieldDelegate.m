#import "FileListViewController+NSTextFieldDelegate.h"
#import <objc/runtime.h>

static const void* TextBeforeEditing = &TextBeforeEditing;
 
@implementation FileListViewController (NSTableViewDelegate)

- (void)controlTextDidBeginEditing:(NSNotification *)obj {
    self.textBeforeEditing = ((NSTextField*)obj.object).stringValue;
}

- (void)controlTextDidEndEditing:(NSNotification *)obj {
    ((NSTextField*)obj.object).editable = NO;
}

- (void)setTextBeforeEditing:(NSString*)text {
    objc_setAssociatedObject(self, TextBeforeEditing, text, OBJC_ASSOCIATION_COPY_NONATOMIC);
}
 
- (NSString *)textBeforeEditing {
    return objc_getAssociatedObject(self, TextBeforeEditing);
}

@end
