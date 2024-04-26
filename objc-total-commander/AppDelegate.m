#import "AppDelegate.h"
#import "TotalCommanderWindowController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate {
    TotalCommanderWindowController* windowController;
}

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    if(windowController == nil) {
        windowController = [TotalCommanderWindowController new];
    }
    
    [windowController.window orderFront:self];
}

- (void)applicationWillTerminate:(NSNotification *)aNotification {
}

- (BOOL)applicationSupportsSecureRestorableState:(NSApplication *)app {
    return YES;
}

@end
