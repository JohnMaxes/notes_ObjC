//
//  AddNodeModal.m
//  notes
//
//  Created by macmini 2 on 23/3/26.
//
#import "AddNoteModal.h"
#import "Cocoa/Cocoa.h"

@implementation AddNoteModal

-(void)createButtonPressed:(id)sender {
    NSString * title = _titleTextField.stringValue;
    NSString * initContent = _initialContentTextField.stringValue;
    
    if (![title isEqualToString:@""] && ![initContent isEqualToString:@""]) {
        NoteNode * newNote = [NoteNode createFromTitle:title
                                            andContent:initContent];
        [self dismissViewController:self];
        [self.delegate onCreateNote:newNote];
    }
}

- (void)cancelButtonPressed:(id)sender {
    [self dismissViewController:self];
}

@end
