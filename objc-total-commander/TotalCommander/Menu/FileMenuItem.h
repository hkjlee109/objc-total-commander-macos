#import <Cocoa/Cocoa.h>

NS_ASSUME_NONNULL_BEGIN

@protocol FileMenuItemDelegate

- (void)didTapView;
- (void)didTapEdit;
- (void)didTapRename;
- (void)didTapNewFolder;
- (void)didTapDelete;

@end

@interface FileMenuItem : NSMenuItem

@property (nonatomic, weak) id<FileMenuItemDelegate> delegate;

@end

NS_ASSUME_NONNULL_END
