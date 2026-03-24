//
//  AppToolbar.m
//  notes
//
//  Created by macmini 2 on 23/3/26.
//
#import "AppToolbar.h"
#import "Cocoa/Cocoa.h"

@implementation AppToolbar

- (instancetype)initWithFrame:(NSRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self commonInit];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder {
    self = [super initWithCoder:coder];
    if (self) {
        [self commonInit];
    }
    return self;
}

- (void)commonInit {
    NSNib *nib = [[NSNib alloc] initWithNibNamed:@"AppToolbar" bundle:nil];
    NSArray *topLevelObjects;

    [nib instantiateWithOwner:self topLevelObjects:&topLevelObjects];

    for (id obj in topLevelObjects) {
        if ([obj isKindOfClass:[NSView class]]) {
            self.contentView = obj;
            break;
        }
    }

//    self.contentView.frame = self.bounds;
//    self.contentView.autoresizingMask = NSViewWidthSizable | NSViewHeightSizable;

    [self addSubview:_stack];
//    [self addMock];
}

-(void)addMock {
    NSButton *bold = [[NSButton alloc] init];
    NSButton *italic = [[NSButton alloc] init];
    NSButton *italic2 = [[NSButton alloc] init];
    
    [bold setTitle:@"1"];
    [italic setTitle:@"2"];
    [italic2 setTitle:@"3"];

    [self.stack addArrangedSubview:bold];
    [self.stack addArrangedSubview:italic];
    [self.stack addArrangedSubview:italic2];
}

@end
