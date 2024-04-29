#import "TotalCommanderViewController.h"
#import "PanelViewController.h"
#import "FileListViewController.h"

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
    
    NSSplitViewItem* leftItem = [NSSplitViewItem contentListWithViewController:_leftPanel];
    NSSplitViewItem* rightItem = [NSSplitViewItem contentListWithViewController:_rightPanel];
    
    [self addSplitViewItem:leftItem];
    [self addSplitViewItem:rightItem];
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
