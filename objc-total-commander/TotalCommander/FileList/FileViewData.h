#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface FileViewData : NSObject

- (id)initWithFileData;

@property (nonatomic, readonly) NSString* name;

@end

NS_ASSUME_NONNULL_END
