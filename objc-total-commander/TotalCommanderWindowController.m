#import "TotalCommanderWindowController.h"
#import "TotalCommanderViewController.h"
#import "MainMenu.h"

@interface TotalCommanderWindowController ()

@end

@implementation TotalCommanderWindowController

- (id)init {
    self = [super init];
    
    if(!self) {
        return nil;
    }
    
    NSPanel* panel = [
        [NSPanel alloc]
        initWithContentRect:NSZeroRect
        styleMask: NSWindowStyleMaskTitled | NSWindowStyleMaskClosable
        backing:NSBackingStoreBuffered
        defer:YES
    ];
    
    panel.floatingPanel = YES;
    panel.titlebarAppearsTransparent = YES;
    [panel setFrame:NSMakeRect(0, 0, 720, 480) display:YES animate:NO];

    TotalCommanderViewController* controller = [TotalCommanderViewController new];

    [panel setContentViewController:controller];
    [panel setRestorable:NO];
    [panel center];
    self.window = panel;
    
    NSApplication.sharedApplication.mainMenu = [MainMenu new];
    
    return self;
}

@end
