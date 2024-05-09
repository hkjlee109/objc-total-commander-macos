#import <Cocoa/Cocoa.h>

NS_ASSUME_NONNULL_BEGIN

@protocol AppMenuDelegate

@end

@interface AppMenu : NSMenu

@property (nonatomic, weak) id<AppMenuDelegate> delegate;

@end

NS_ASSUME_NONNULL_END
