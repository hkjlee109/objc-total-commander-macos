#import <Cocoa/Cocoa.h>
#import "FileViewData.h"

NS_ASSUME_NONNULL_BEGIN

@interface FileListViewController : NSViewController

@property (nonatomic, strong) NSTableView* tableView;
@property (nonatomic, strong) NSScrollView* scrollView;
@property (nonatomic, strong) NSArray<FileViewData*>* files;
@property (nonatomic, strong) NSSet<NSString*>* selectedFiles;

- (void)renameSelected;

@end

NS_ASSUME_NONNULL_END
