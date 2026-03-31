//
//  NavigatorController.h
//  notes
//
//  Created by macmini 2 on 20/3/26.
//
#import <Cocoa/Cocoa.h>
#import "Note+CoreDataClass.h"
#import "AddNoteModalController.h"
#import "AddFolderModalController.h"
#import "FileContentService.h"
#import "NotesService.h"

@protocol SidebarDelegate <NSObject>
-(void)noteSelected:(Note *)note;
-(void)itemDeleted;
@end

@interface SidebarController : NSViewController
    <NSOutlineViewDataSource, NSOutlineViewDelegate,
    AddNoteDelegate, AddFolderDelegate >

@property (strong) NotesService * noteService;
@property (strong) FileContentService * fileContentService;
@property IBOutlet NSOutlineView * outlineView;
@property (strong) NSArray *rootItems;
@property (weak) id<SidebarDelegate> delegate;

-(IBAction)addButtonPressed:(id)sender;
-(IBAction)folderButtonPressed:(id)sender;
-(IBAction)delete:(id)sender;

@end
