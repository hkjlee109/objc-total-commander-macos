#import "FileActionFlags.h"
#import "FileMenu.h"
#import <Cocoa/Cocoa.h>

NS_ASSUME_NONNULL_BEGIN

@interface TotalCommanderViewController : NSSplitViewController<FileMenuItemDelegate>

@property (nonatomic, assign) FileActionFlags availableFileActions;

@end

NS_ASSUME_NONNULL_END
