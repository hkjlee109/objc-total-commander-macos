#import <Cocoa/Cocoa.h>

NS_ASSUME_NONNULL_BEGIN

@protocol FileListTableViewResponderDelegate

- (void)tableViewBecomeFirstResponder;
- (void)tableViewResignFirstResponder;

@end

@interface FileListTableView : NSTableView

@property (nonatomic, weak) id<FileListTableViewResponderDelegate> responderDelegate;

@end

NS_ASSUME_NONNULL_END
