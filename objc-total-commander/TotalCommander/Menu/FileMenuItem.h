#import "FileActionFlags.h"
#import <Cocoa/Cocoa.h>

NS_ASSUME_NONNULL_BEGIN

@protocol FileMenuItemDelegate

- (void)didSelectFileMenu:(FileActionFlags)action;

@end

@interface FileMenuItem : NSMenuItem

@property (nonatomic, weak) id<FileMenuItemDelegate> delegate;
@property (nonatomic, assign) FileActionFlags availableFileActions;

@end

NS_ASSUME_NONNULL_END
