//
//  ContentViewController.m
//  notes
//
//  Created by macmini 2 on 20/3/26.
//

#import <Cocoa/Cocoa.h>
#import "ContentViewController.h"
#import "Note+CoreDataClass.h"
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

-(void)displayContentWithNote:(Note *) note {
    self.isUpdatingUI = YES;
    _currNote = note;
    _textView.string = @"This is a valid note";
    self.isUpdatingUI = NO;
}

-(void)textDidChange:(NSNotification *)notification{
    NSLog(@"Editing note: %p with new content: %@",
          _currNote, _textView.string);
    if (self.isUpdatingUI) return;
    // _currNote.content = _textView.string;
    // TODO: allow for async file writing with FileContentService
}

@end
