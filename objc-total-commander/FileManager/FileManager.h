#import "FileData.h"
#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface FileManager : NSObject

- (NSArray*)getFileList:(NSString*)path;

@end

NS_ASSUME_NONNULL_END
