//
//  NotesService.h
//  notes
//
//  Created by macmini 2 on 30/3/26.
//
#import <Cocoa/Cocoa.h>
#import "Folder+CoreDataClass.h"
#import "Note+CoreDataClass.h"

@interface NotesService: NSObject

- (NSArray *)getRootItems;

-(void)createNoteWithTitle:(NSString *)title inFolder:(Folder *)folder;
-(void)deleteNoteEntity:(Note*)note;


-(void)createFolderWithTitle:(NSString *)title inFolder:(Folder *)folder;
-(void)deleteFolderEntity:(Folder*)folder;

-(void)renameNote:(Note *)note title:(NSString *)title;
-(void)renameFolder:(Folder *)folder title:(NSString *)title;

@end
