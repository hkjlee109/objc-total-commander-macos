#import "ViewController.h"
#import "TotalCommanderViewController.h"

@implementation ViewController {
    TotalCommanderViewController* _tcvc;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    _tcvc = [TotalCommanderViewController new];
    _tcvc.view.translatesAutoresizingMaskIntoConstraints = NO;
    
    [self.view addSubview:_tcvc.view];
    [_tcvc.view.topAnchor constraintEqualToAnchor:self.view.topAnchor].active = YES;
    [_tcvc.view.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor].active = YES;
    [_tcvc.view.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor].active = YES;
    [_tcvc.view.bottomAnchor constraintEqualToAnchor:self.view.bottomAnchor].active = YES;
}

- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];
}

@end
