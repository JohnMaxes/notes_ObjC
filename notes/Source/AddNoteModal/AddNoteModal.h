//
//  AddNoteModal.h
//  notes
//
//  Created by macmini 2 on 23/3/26.
//
#import "Cocoa/Cocoa.h"
#import "NoteNode.h"

@protocol AddNoteDelegate <NSObject>
-(void)onAddNotePress:(NoteNode *)note;
@end

@interface AddNoteModal : NSWindowController



@end
