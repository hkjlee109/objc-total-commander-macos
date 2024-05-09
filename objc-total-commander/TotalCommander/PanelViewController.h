#import <Cocoa/Cocoa.h>
#import "FileListViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface PanelViewController : NSViewController

@property (nonatomic, strong) FileListViewController* fileList;

- (void)renameSelected;
- (void)showContextMenu;

@end

NS_ASSUME_NONNULL_END
