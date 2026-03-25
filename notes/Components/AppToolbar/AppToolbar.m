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
    
    [self addSubview:self.contentView];
    [self addMock];
}

-(void)addButton:(NSButton*) button {
    [self.stack addArrangedSubview:button];
    [self setupButtonAction:button atIndex:[self.stack.arrangedSubviews count] - 1];
}

-(void)addButtons:(NSArray<NSButton *>*) buttons {
    for(NSButton *button in buttons) {
        [self.stack addArrangedSubview:button];
        [self setupButtonAction:button atIndex:[self.stack.arrangedSubviews count] - 1];
    }
}

- (void)setupButtonAction:(NSButton *)button atIndex:(NSInteger)index {
    button.tag = index;
    [button setTarget:self];
    [button setAction:@selector(buttonClicked:)];
}

- (void)buttonClicked:(NSButton *)sender {
    if ([self.delegate respondsToSelector:@selector(toolbar:didClickButtonAtIndex:)])
        [self.delegate toolbar:self didClickButtonAtIndex:sender.tag];
}

-(void)addMock {
    NSButton *bold = [[NSButton alloc] init];
    NSButton *italic = [[NSButton alloc] init];
    NSButton *italic2 = [[NSButton alloc] init];
    
    [bold setTitle:@"1"];
    [italic setTitle:@"2"];
    [italic2 setTitle:@"3"];

    [self addButtons:@[bold, italic, italic2]];
}

@end
