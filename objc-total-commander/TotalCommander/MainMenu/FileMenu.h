#import "FileActionFlags.h"

#import <Cocoa/Cocoa.h>

NS_ASSUME_NONNULL_BEGIN

@protocol FileMenuItemDelegate

- (void)didSelectFileMenuItem:(FileActionFlags)action;

@end

@interface FileMenu : NSMenu

@property (nonatomic, weak) id<FileMenuItemDelegate> itemDelegate;
@property (nonatomic, assign) FileActionFlags availableFileActions;

@end

NS_ASSUME_NONNULL_END
