//
//  NotesService.h
//  notes
//
//  Created by macmini 2 on 30/3/26.
//
#import <Cocoa/Cocoa.h>
#import "Folder+CoreDataClass.h"
#import "Note+CoreDataClass.h"
#import "FolderContainable.h"

@interface NotesService: NSObject

-(NSArray *)getRootItems;
-(id)getManagedObjectWithManagedObjectIdUri:(NSURL *) managedObjectIdUri;
-(void)assignRootAsParentToItem:(id)item;

-(Folder*)createFolderWithTitle:(NSString *)title inFolder:(Folder *)folder;
-(Note*)createNoteWithTitle:(NSString *)title
                   inFolder:(Folder *)folder
                     atPath:(NSString *)path;

-(void)deleteFolderEntity:(Folder*)folder;
-(void)deleteNoteEntity:(Note*)note;

-(void)renameNote:(Note *)note title:(NSString *)title;
-(void)renameFolder:(Folder *)folder title:(NSString *)title;

-(void)moveItem:(id<FolderContainable>)item
       toParent:(Folder *)targetFolder;
@end
