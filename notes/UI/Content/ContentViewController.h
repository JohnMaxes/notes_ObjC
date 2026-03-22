//
//  ContentViewController.h
//  notes
//
//  Created by macmini 2 on 20/3/26.
//
#import "Cocoa/Cocoa.h"
#import "NoteNode.h"

@interface ContentViewController : NSViewController <NSTextViewDelegate>

@property IBOutlet NSView * parentView;
@property IBOutlet NSScrollView * scrollView;
@property IBOutlet NSTextView * textView;

@property (strong) NoteNode* currNote;
@property (nonatomic, assign) BOOL isUpdatingUI;
-(void)displayContentWithNote:(NoteNode*) note;

@end
