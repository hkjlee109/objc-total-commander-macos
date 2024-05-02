#pragma once

#import "Foundation/Foundation.h"

typedef NS_OPTIONS(NSUInteger, FileAction) {
    FileActionUpload             = 1 << 0,
    FileActionDownload           = 1 << 1,
    FileActionRename             = 1 << 2,
    FileActionDelete             = 1 << 3,
};
