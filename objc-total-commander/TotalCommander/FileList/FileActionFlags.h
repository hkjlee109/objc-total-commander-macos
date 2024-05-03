#pragma once

#import "Foundation/Foundation.h"

typedef NS_OPTIONS(NSUInteger, FileActionFlags) {
    FileActionFlagView               = 1 << 1,
    FileActionFlagEdit               = 1 << 2,
    FileActionFlagCopy               = 1 << 3,
    FileActionFlagMove               = 1 << 4,
    FileActionFlagRename             = 1 << 5,
    FileActionFlagNewFolder          = 1 << 6,
    FileActionFlagDelete             = 1 << 7,
};
