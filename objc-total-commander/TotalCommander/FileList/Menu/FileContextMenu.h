#import "FileActionFlags.h"
#import <Cocoa/Cocoa.h>

NS_ASSUME_NONNULL_BEGIN

@protocol FileContextMenuItemDelegate

- (void)didSelectFileContextMenuItem:(FileActionFlags)action;

@end

@interface FileContextMenu : NSMenu

@property (nonatomic, weak) id<FileContextMenuItemDelegate> itemDelegate;
@property (nonatomic, assign) FileActionFlags availableFileActions;

@end

NS_ASSUME_NONNULL_END
