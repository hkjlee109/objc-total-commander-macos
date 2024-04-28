#import "AppMenuItem.h"
#import "FileMenuItem.h"
#import <Cocoa/Cocoa.h>

NS_ASSUME_NONNULL_BEGIN

@interface MainMenu : NSMenu

@property (nonatomic, strong) AppMenuItem* appMenuItem;
@property (nonatomic, strong) FileMenuItem* fileMenuItem;

@end

NS_ASSUME_NONNULL_END
