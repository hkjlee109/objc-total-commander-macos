#import "AppMenu.h"
#import "FileMenu.h"
#import <Cocoa/Cocoa.h>

NS_ASSUME_NONNULL_BEGIN

@interface MainMenu : NSMenu

@property (nonatomic, strong) AppMenu* appMenu;
@property (nonatomic, strong) FileMenu* fileMenu;

@end

NS_ASSUME_NONNULL_END
