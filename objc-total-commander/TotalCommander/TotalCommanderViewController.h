#import "FileAction.h"
#import "FileMenuItem.h"
#import <Cocoa/Cocoa.h>

NS_ASSUME_NONNULL_BEGIN

@interface TotalCommanderViewController : NSSplitViewController<FileMenuItemDelegate>

@property (nonatomic, assign) NSUInteger availableFileActions;

@end

NS_ASSUME_NONNULL_END
