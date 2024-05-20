#import "TotalCommanderViewController+QLPreviewPanel.h"
#import "FileData.h"

@interface FileData (QLPreviewItem) <QLPreviewItem>

@end

@implementation FileData (QLPreviewItem)

- (NSURL*)previewItemURL {
    return [self.parentDirectoryURL URLByAppendingPathComponent:self.name];
}

- (NSString*)previewItemTitle {
    return self.name;
}

@end


@implementation TotalCommanderViewController (QLPreviewPanel)

- (BOOL)acceptsPreviewPanelControl:(QLPreviewPanel *)panel {
    return YES;
}

- (void)beginPreviewPanelControl:(QLPreviewPanel *)panel {
    self.previewPanel = panel;
    panel.delegate = self;
    panel.dataSource = self;
}

- (void)endPreviewPanelControl:(QLPreviewPanel *)panel {
    self.previewPanel = nil;
}

- (NSInteger)numberOfPreviewItemsInPreviewPanel:(QLPreviewPanel *)panel { 
    return self.leftPanel.selectedFiles.count;
}

- (id<QLPreviewItem>)previewPanel:(QLPreviewPanel *)panel previewItemAtIndex:(NSInteger)index { 
    FileData* data = [[FileData alloc] initWithData:@"Intro.rtf"
                                 parentDirectoryURL:[NSURL URLWithString:@"/Users/kyung"]
                                   modificationDate:[NSDate alloc]
                                        isDirectory:NO];
    return self.leftPanel.selectedFiles[index];
}

@end
