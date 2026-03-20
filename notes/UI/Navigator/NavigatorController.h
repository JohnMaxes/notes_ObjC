//
//  NavigatorController.h
//  notes
//
//  Created by macmini 2 on 20/3/26.
//
#import <Cocoa/Cocoa.h>
#import "NoteNode.h"

@interface NavigatorController : NSViewController <NSOutlineViewDataSource, NSOutlineViewDelegate>

@property IBOutlet NSOutlineView * outlineView;
@property (strong) NSMutableArray<NoteNode *> *rootNodes;

@end
