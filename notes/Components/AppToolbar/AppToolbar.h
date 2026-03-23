//
//  AppToolbar.h
//  notes
//
//  Created by macmini 2 on 23/3/26.
//
#import "Cocoa/Cocoa.h"

@interface AppToolbar : NSView

@property IBOutlet NSView * container;
@property IBOutlet NSStackView * stack;

@property (strong) IBOutlet NSView *contentView;

@end
