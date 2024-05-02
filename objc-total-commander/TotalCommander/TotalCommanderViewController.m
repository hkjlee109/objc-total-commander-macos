#import "TotalCommanderViewController.h"

#import "FileListViewController.h"
#import "MainMenu.h"
#import "PanelViewController.h"

@interface TotalCommanderViewController () {
    PanelViewController* _leftPanel;
    PanelViewController* _rightPanel;
}
@end

@implementation TotalCommanderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _leftPanel = [PanelViewController new];
    _rightPanel = [PanelViewController new];
    
    __weak TotalCommanderViewController *weakSelf = self;
    _leftPanel.fileList.availableFileActionsUpdater = ^(NSUInteger actions){
        TotalCommanderViewController *strongSelf = weakSelf;
        [strongSelf availableFileActionsHandler:actions];
        if(strongSelf) {
            [strongSelf availableFileActionsHandler:actions];
        }
    };
    _rightPanel.fileList.availableFileActionsUpdater = ^(NSUInteger actions){
        TotalCommanderViewController *strongSelf = weakSelf;
        if(strongSelf) {
            [strongSelf availableFileActionsHandler:actions];
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

- (void)availableFileActionsHandler:(NSUInteger)actions {
    MainMenu* mainMenu = (MainMenu*)NSApplication.sharedApplication.mainMenu;
    mainMenu.fileMenuItem.availableFileActions = actions;
}

- (void)didTapView {
    
}

- (void)didTapEdit { 
    
}

- (void)didTapNewFolder { 
    
}

- (void)didTapRename { 
    [_leftPanel renameSelected];
    [_rightPanel renameSelected];
}

- (void)didTapDelete {
    
}

@end
