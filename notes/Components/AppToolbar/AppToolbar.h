//
//  AppToolbar.h
//  notes
//
//  Created by macmini 2 on 23/3/26.
//
#import "Cocoa/Cocoa.h"

@class AppToolbar;

@protocol AppToolbarDelegate <NSObject>
- (void)toolbar:(AppToolbar *)toolbar didClickButtonAtIndex:(NSInteger)index;
@end

@interface AppToolbar : NSView

@property IBOutlet NSStackView * stack;
@property (strong) IBOutlet NSView *contentView;
@property (weak) IBOutlet id<AppToolbarDelegate> delegate;

@end
