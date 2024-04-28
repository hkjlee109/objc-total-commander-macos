#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface FileData : NSObject

- (id)initWithData:(NSString*)name
  modificationDate:(NSDate*)modificationDate
       isDirectory:(BOOL)isDirectory;

@property (nonatomic, strong) NSString* name;
@property (nonatomic, strong) NSDate* modificationDate;
@property (nonatomic, assign) BOOL isDirectory;

@end

NS_ASSUME_NONNULL_END
