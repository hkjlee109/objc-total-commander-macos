#import <Cocoa/Cocoa.h>
#import "FileListViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface PanelViewController : NSViewController

@property (nonatomic, strong) FileListViewController* fileList;
@property (nonatomic, strong) NSDictionary* files;

- (NSArray<FileData*>*)selectedFiles;

- (void)renameSelected;
- (void)showContextMenu;

@end

NS_ASSUME_NONNULL_END
