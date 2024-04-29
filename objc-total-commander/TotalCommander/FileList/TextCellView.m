#import "TextCellView.h"

@implementation TextCellView 

- (instancetype)initWithFrame:(NSRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        _nameTextField = [[NSTextField alloc] initWithFrame:CGRectZero];
        [self addSubview:_nameTextField];
        _nameTextField.translatesAutoresizingMaskIntoConstraints = NO;
        _nameTextField.bezeled = NO;
        _nameTextField.editable = NO;
        _nameTextField.backgroundColor = [NSColor clearColor];
        _nameTextField.alignment = NSTextAlignmentLeft;
        [_nameTextField setFont:[NSFont systemFontOfSize:12]];
        [_nameTextField.leadingAnchor constraintEqualToAnchor:self.leadingAnchor].active = YES;
        [_nameTextField.trailingAnchor constraintEqualToAnchor:self.trailingAnchor].active = YES;
        [_nameTextField.centerYAnchor constraintEqualToAnchor:self.centerYAnchor].active = YES;
    }
    return self;
}

- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
}

@end
