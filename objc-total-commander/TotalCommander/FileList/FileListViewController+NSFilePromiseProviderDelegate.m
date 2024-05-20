#import "FileListViewController+NSFilePromiseProviderDelegate.h"

@implementation FileListViewController (NSFilePromiseProviderDelegate)

- (nonnull NSString *)filePromiseProvider:(nonnull NSFilePromiseProvider *)filePromiseProvider fileNameForType:(nonnull NSString *)fileType { 
    return filePromiseProvider.userInfo;
}

- (void)filePromiseProvider:(nonnull NSFilePromiseProvider *)filePromiseProvider writePromiseToURL:(nonnull NSURL *)url completionHandler:(nonnull void (^)(NSError * _Nullable))completionHandler {
}

@end
