#import <Cocoa/Cocoa.h>
#import "FileActionFlags.h"
#import "FileContextMenu.h"
#import "FileListTableView.h"
#import "FileViewData.h"

NS_ASSUME_NONNULL_BEGIN

@interface FileListViewController : NSViewController

@property (nonatomic, strong) FileListTableView* tableView;
@property (nonatomic, strong) FileContextMenu* contextMenu;
@property (nonatomic, strong) NSScrollView* scrollView;
@property (nonatomic, strong) NSArray<FileViewData*>* files;
@property (nonatomic, strong) NSArray<NSString*>* selectedFiles;
@property (nonatomic, copy) void (^onAvailableFileActionsChange)(FileActionFlags);

- (BOOL)isFocused;
- (void)setFocus;
- (void)updateAvailableFileActions;

- (void)renameSelected;
- (void)showContextMenu;
    
@end

NS_ASSUME_NONNULL_END
