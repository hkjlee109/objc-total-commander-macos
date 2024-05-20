#import "PanelViewController.h"
#import "FileManager.h"

#include <unistd.h>
#include <sys/types.h>
#include <pwd.h>
#include <assert.h>

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
    
    NSMutableArray* viewDataArray = [NSMutableArray new];
    for(FileData* file in files) {
        [viewDataArray addObject:[[FileViewData alloc] initWithFileData:file]];
    }
    _fileList.files = viewDataArray;
    
    NSMutableDictionary* dictionary = [NSMutableDictionary new];
    for(FileData* file in files) {
        [dictionary setValue:file forKey:file.uuid];
    }
    _files = dictionary;
}

- (NSArray<FileData*>*)selectedFiles {
    NSMutableArray* r = [NSMutableArray new];
    for(NSString* uuid in _fileList.selectedFiles) {
        [r addObject:[_files valueForKey:uuid]];
    }
    return r;
}

- (void)renameSelected {
    [_fileList renameSelected];
}

- (void)showContextMenu {
    [_fileList showContextMenu];
}

@end
