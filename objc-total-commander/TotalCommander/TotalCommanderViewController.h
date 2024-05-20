#import "FileActionFlags.h"
#import "FileMenu.h"
#import "PanelViewController.h"
#import <Cocoa/Cocoa.h>
#import <Quartz/Quartz.h>

NS_ASSUME_NONNULL_BEGIN

@interface TotalCommanderViewController : NSSplitViewController

@property (nonatomic, assign) FileActionFlags availableFileActions;
@property (nonatomic, strong, nullable) QLPreviewPanel* previewPanel;

@property (nonatomic, strong) PanelViewController* leftPanel;
@property (nonatomic, strong) PanelViewController* rightPanel;

@end

NS_ASSUME_NONNULL_END
