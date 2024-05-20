#import "TotalCommanderViewController.h"

#import "FileListViewController.h"
#import "MainMenu.h"
#import "PanelViewController.h"

@interface TotalCommanderViewController () {
//    PanelViewController* _leftPanel;
//    PanelViewController* _rightPanel;
}
@end

@implementation TotalCommanderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _leftPanel = [PanelViewController new];
    _rightPanel = [PanelViewController new];
    
    __weak TotalCommanderViewController *weakSelf = self;
    _leftPanel.fileList.onAvailableFileActionsChange = ^(NSUInteger actions){
        TotalCommanderViewController *strongSelf = weakSelf;
        if(strongSelf) {
            [strongSelf updateAvailableFileActions:actions];
        }
    };
    _rightPanel.fileList.onAvailableFileActionsChange = ^(NSUInteger actions){
        TotalCommanderViewController *strongSelf = weakSelf;
        if(strongSelf) {
            [strongSelf updateAvailableFileActions:actions];
        }
    };
    
    NSSplitViewItem* leftItem = [NSSplitViewItem contentListWithViewController:_leftPanel];
    NSSplitViewItem* rightItem = [NSSplitViewItem contentListWithViewController:_rightPanel];
    
    [self addSplitViewItem:leftItem];
    [self addSplitViewItem:rightItem];
}

- (void)keyDown:(NSEvent *)event {
    if ([[event characters] characterAtIndex:0] == NSTabCharacter) {
        BOOL isLeftFocused = _leftPanel.fileList.isFocused;
        BOOL isRightFocused = _rightPanel.fileList.isFocused;
        
        if(!isLeftFocused && !isRightFocused) {
            [_leftPanel.fileList setFocus];
        } else if(isLeftFocused && !isRightFocused) {
            [_rightPanel.fileList setFocus];
        } else if(!isLeftFocused && isRightFocused) {
            [_leftPanel.fileList setFocus];
        }
        return;
    }
    
    [super keyDown:event];
}

- (void)updateAvailableFileActions:(NSUInteger)actions {
    MainMenu* mainMenu = (MainMenu*)NSApplication.sharedApplication.mainMenu;
    mainMenu.fileMenu.availableFileActions = actions;
}

- (void)processFileMenuItemAction:(NSMenuItem*)sender {
    switch(sender.tag) {
        case FileActionFlagContextMenu:
            [_leftPanel showContextMenu];
            [_rightPanel showContextMenu];
            break;
        case FileActionFlagView:
            if ([QLPreviewPanel sharedPreviewPanelExists]
                && [[QLPreviewPanel sharedPreviewPanel] isVisible]) {
                [[QLPreviewPanel sharedPreviewPanel] orderOut:nil];
            } else {
                [[QLPreviewPanel sharedPreviewPanel] makeKeyAndOrderFront:nil];
            }
            break;
        case FileActionFlagEdit:
            break;
        case FileActionFlagCopy:
            break;
        case FileActionFlagMove:
            break;
        case FileActionFlagRename:
            [_leftPanel renameSelected];
            [_rightPanel renameSelected];
            break;
        case FileActionFlagNewFolder:
            break;
        case FileActionFlagDelete:
            break;
    }
}

@end
