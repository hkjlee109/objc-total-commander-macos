#import <Cocoa/Cocoa.h>

NS_ASSUME_NONNULL_BEGIN

@protocol MainMenuDelegate

@end

@interface MainMenu : NSMenu

@property (nonatomic, weak) id<MainMenuDelegate> mainMenuDelegate;

@end

NS_ASSUME_NONNULL_END
