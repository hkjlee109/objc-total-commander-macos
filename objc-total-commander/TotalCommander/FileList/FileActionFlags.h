#pragma once

#import "Foundation/Foundation.h"

typedef NS_OPTIONS(NSUInteger, FileActionFlags) {
    FileActionFlagContextMenu        = 1 << 1,
    FileActionFlagView               = 1 << 2,
    FileActionFlagEdit               = 1 << 3,
    FileActionFlagCopy               = 1 << 4,
    FileActionFlagMove               = 1 << 5,
    FileActionFlagRename             = 1 << 6,
    FileActionFlagNewFolder          = 1 << 7,
    FileActionFlagDelete             = 1 << 8,
};
