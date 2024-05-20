#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface FileData : NSObject

- (id)initWithData:(NSString*)name
parentDirectoryURL:(NSURL*)parentDirectoryURL
  modificationDate:(NSDate*)modificationDate
       isDirectory:(BOOL)isDirectory;

@property (nonatomic, strong) NSString* uuid;
@property (nonatomic, strong) NSString* name;
@property (nonatomic, strong) NSURL* parentDirectoryURL;
@property (nonatomic, strong) NSDate* modificationDate;
@property (nonatomic, assign) BOOL isDirectory;

@end

NS_ASSUME_NONNULL_END
