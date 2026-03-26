//
//  ContentViewController.m
//  notes
//
//  Created by macmini 2 on 20/3/26.
//

#import <Cocoa/Cocoa.h>
#import "ContentViewController.h"
#import "NoteNode.h"

@implementation ContentViewController

- (instancetype)init {
    self = [super initWithNibName:@"Content" bundle:NULL];
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    _textView.delegate = self;
}

-(void)awakeFromNib {
    [super awakeFromNib];
    _scrollView.wantsLayer = YES;
    _scrollView.layer.cornerRadius = 8;
    _scrollView.layer.borderWidth = 1;
}

-(void)displayContentWithNote:(NoteNode*) note {
    NSLog(@"Displaying note: %p title: %@ content: %@",
          note, note.title, note.content);
    self.isUpdatingUI = YES;
    _currNote = note;
    _textView.string = note.content ?: @"";
    self.isUpdatingUI = NO;
}

-(void)textDidChange:(NSNotification *)notification{
    NSLog(@"Editing note: %p with new content: %@",
          _currNote, _textView.string);
    if (self.isUpdatingUI) return;
    _currNote.content = _textView.string;
}

@end
