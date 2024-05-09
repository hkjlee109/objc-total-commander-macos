#import "PanelViewController.h"
#import "FileManager.h"

@interface PanelViewController ()

@end

@implementation PanelViewController {
    FileManager* _fileManager;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        _fileList = [FileListViewController new];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self addChildViewController:_fileList];
    [self.view addSubview:_fileList.view];
    [_fileList.view.topAnchor constraintEqualToAnchor:self.view.topAnchor].active = YES;
    [_fileList.view.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor].active = YES;
    [_fileList.view.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor].active = YES;
    [_fileList.view.bottomAnchor constraintEqualToAnchor:self.view.bottomAnchor].active = YES;
    
    self.view.wantsLayer = YES;
    self.view.layer.backgroundColor = [[NSColor blueColor] CGColor];
    
    _fileManager = [FileManager new];
    [self loadFileList:NSHomeDirectory()];
}

- (void)loadFileList:(NSString*)path {
    NSArray* files = [_fileManager getFileList:path];
    NSMutableArray* r = [[NSMutableArray alloc] init];
    for(FileData* file in files) {
        [r addObject:[[FileViewData alloc] initWithFileData:file]];
    }
    _fileList.files = r;
}

- (void)renameSelected {
    [_fileList renameSelected];
}

- (void)showContextMenu {
    [_fileList showContextMenu];
}

@end
