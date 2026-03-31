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
    _fileContentService = [[FileContentService alloc] init];
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
    NSAttributedString *content = [_fileContentService readNoteFileAtPath:note.contentPath];
    [_textView.textStorage setAttributedString:content];
    
    self.isUpdatingUI = NO;
}

-(void)textDidChange:(NSNotification *)notification{
    if (self.isUpdatingUI) return;
    NSAttributedString *content = _textView.attributedString;
    [_fileContentService saveNoteContent:content toPath:_currNote.contentPath];
}

-(void)clearDisplayContent {
    _currNote = nil;
    _textView.string = @"";
}

@end
