#import "PanelViewController.h"
#import "FileListViewController.h"

@interface PanelViewController ()

@end

@implementation PanelViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    FileListViewController* vc = [FileListViewController new];
    
    [self addChildViewController:vc];
    [self.view addSubview:vc.view];
    [vc.view.topAnchor constraintEqualToAnchor:self.view.topAnchor].active = YES;
    [vc.view.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor].active = YES;
    [vc.view.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor].active = YES;
    [vc.view.bottomAnchor constraintEqualToAnchor:self.view.bottomAnchor].active = YES;
    
    self.view.wantsLayer = YES;
    self.view.layer.backgroundColor = [[NSColor blueColor] CGColor];
}

@end
