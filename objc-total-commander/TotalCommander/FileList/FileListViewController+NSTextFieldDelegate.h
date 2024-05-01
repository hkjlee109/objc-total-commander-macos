#import "FileListViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface FileListViewController (NSTextFieldDelegate) <NSTextFieldDelegate>

@property (nonatomic, copy) NSString* textBeforeEditing;

@end

NS_ASSUME_NONNULL_END
