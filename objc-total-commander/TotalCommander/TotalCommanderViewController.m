#import "TotalCommanderViewController.h"
#import "PanelViewController.h"
#import "FileListViewController.h"

@interface TotalCommanderViewController ()

@end

@implementation TotalCommanderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    id left = [PanelViewController new];
    id right = [PanelViewController new];
    
    NSSplitViewItem* leftItem = [NSSplitViewItem contentListWithViewController:left];
    NSSplitViewItem* rightItem = [NSSplitViewItem contentListWithViewController:right];
    
    [self addSplitViewItem:leftItem];
    [self addSplitViewItem:rightItem];
}

@end
