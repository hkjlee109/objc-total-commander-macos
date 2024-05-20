#import "FileData.h"
#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface FileViewData : NSObject

- (id)initWithFileData:(FileData*)fileData;

@property (nonatomic, readonly) NSString* uuid;
@property (nonatomic, readonly) NSString* name;

@end

NS_ASSUME_NONNULL_END
