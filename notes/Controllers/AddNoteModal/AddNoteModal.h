//
//  AddNoteModal.h
//  notes
//
//  Created by macmini 2 on 23/3/26.
//
#import "Cocoa/Cocoa.h"
#import "NoteNode.h"

@protocol AddNoteDelegate <NSObject>
    -(void)onCreateNote:(NoteNode *)note;
@end


@interface AddNoteModal : NSViewController
    @property (weak) id<AddNoteDelegate> delegate;
    @property IBOutlet NSTextField * titleTextField;
    @property IBOutlet NSTextField * initialContentTextField;

    -(IBAction)createButtonPressed:(id)sender;
    -(IBAction)cancelButtonPressed:(id)sender;
@end
