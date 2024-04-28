#import <Cocoa/Cocoa.h>

NS_ASSUME_NONNULL_BEGIN

@protocol AppMenuItemDelegate

@end

@interface AppMenuItem : NSMenuItem

@property (nonatomic, weak) id<AppMenuItemDelegate> delegate;

@end

NS_ASSUME_NONNULL_END
