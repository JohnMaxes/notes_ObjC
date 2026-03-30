//
//  AddNodeModal.m
//  notes
//
//  Created by macmini 2 on 23/3/26.
//
#import "AddNoteModalController.h"
#import "Cocoa/Cocoa.h"

@implementation AddNoteModal

-(void)createButtonPressed:(id)sender {
    NSString * title = _titleTextField.stringValue;
    NSString * initContent = _initialContentTextField.stringValue;
    
    if (![title isEqualToString:@""] && ![initContent isEqualToString:@""]) {
        [self.delegate onCreateNoteWithTitle:title];
        [self dismissViewController:self];
    }
}

- (void)cancelButtonPressed:(id)sender {
    [self dismissViewController:self];
}

@end
