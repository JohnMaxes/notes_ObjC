//
//  NavigatorController.h
//  notes
//
//  Created by macmini 2 on 20/3/26.
//
#import <Cocoa/Cocoa.h>
#import "NoteNode.h"
#import "AddNoteModal.h"

@protocol SidebarDelegate <NSObject>
-(void)noteSelected:(NoteNode *)note;
@end

@interface SidebarController : NSViewController
    <NSOutlineViewDataSource, NSOutlineViewDelegate, AddNoteDelegate>

@property IBOutlet NSOutlineView * outlineView;
@property (strong) NSMutableArray<NoteNode *> *rootNodes;
@property (weak) id<SidebarDelegate> delegate;

-(IBAction)addButtonPressed:(id)sender;
-(IBAction)folderButtonPressed:(id)sender;

@end
