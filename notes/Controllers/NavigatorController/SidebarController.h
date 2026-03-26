//
//  NavigatorController.h
//  notes
//
//  Created by macmini 2 on 20/3/26.
//
#import <Cocoa/Cocoa.h>
#import "NoteNode.h"

@protocol NavigatorDelegate <NSObject>
-(void)noteSelected:(NoteNode *)note;
@end

@interface SidebarController : NSViewController
    <NSOutlineViewDataSource, NSOutlineViewDelegate>

@property IBOutlet NSOutlineView * outlineView;
@property (strong) NSMutableArray<NoteNode *> *rootNodes;
@property (weak) id<NavigatorDelegate> delegate;

@end


