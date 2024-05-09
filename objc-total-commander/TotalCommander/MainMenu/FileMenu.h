#import "FileActionFlags.h"

#import <Cocoa/Cocoa.h>

NS_ASSUME_NONNULL_BEGIN

@interface FileMenu : NSMenu

@property (nonatomic, assign) FileActionFlags availableFileActions;

@end

NS_ASSUME_NONNULL_END
