//
//  NavigatorController.m
//  notes
//
//  Created by macmini 2 on 20/3/26.
//
#import <Cocoa/Cocoa.h>
#import "NoteNode.h"
#import "NavigatorController.h"

@implementation NavigatorController 

- (instancetype)init {
    self = [super initWithNibName:@"Navigator" bundle:NULL];
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    // Create sample data
    NoteNode *work = [NoteNode new];
    work.title = @"Work";
    work.children = [NSMutableArray array];

    NoteNode *personal = [NoteNode new];
    personal.title = @"Personal";
    personal.children = [NSMutableArray array];

    NoteNode *note1 = [NoteNode new];
    note1.title = @"Meeting Notes";
    note1.content = @"Discuss project timeline";
    note1.children = [NSMutableArray array];

    NoteNode *note2 = [NoteNode new];
    note2.title = @"Ideas";
    note2.content = @"Build a macOS notes app";
    note2.children = [NSMutableArray array];

    NoteNode *note3 = [NoteNode new];
    note3.title = @"Shopping List";
    note3.content = @"Milk, Eggs, Coffee";
    note3.children = [NSMutableArray array];
    
    NoteNode *note4 = [NoteNode new];
    note4.title = @"Shopping List";
    note4.content = @"Milk, Eggs, Coffee";
    note4.children = [NSMutableArray array];

    [work.children addObject:note1];
    [work.children addObject:note2];
    
    [note2.children addObject:note4];

    [personal.children addObject:note3];

    self.rootNodes = [NSMutableArray arrayWithArray:@[work, personal]];
    
    self.outlineView.dataSource = self;
    self.outlineView.delegate = self;

    [self.outlineView reloadData];
}

- (NSInteger)outlineView:(NSOutlineView *)outlineView
  numberOfChildrenOfItem:(id)item {
    
    if (item == nil)
        return self.rootNodes.count; // top-level

    NoteNode *node = (NoteNode *)item;
    return node.children.count;
};

- (id)outlineView:(NSOutlineView *)outlineView
            child:(NSInteger)index
           ofItem:(id)item {
    
    if (item == nil)
        return self.rootNodes[index];

    NoteNode *node = (NoteNode *)item;
    return node.children[index];
}

- (BOOL)outlineView:(NSOutlineView *)outlineView
   isItemExpandable:(id)item {
    
    NoteNode *node = (NoteNode *)item;
    return node.children.count > 0;
}

- (NSView *)outlineView:(NSOutlineView *)outlineView
    viewForTableColumn:(NSTableColumn *)tableColumn
                  item:(id)item {

    NoteNode *node = (NoteNode *)item;

    NSTableCellView *cell = [outlineView makeViewWithIdentifier:@"Cell" owner:self];

    if (!cell) {
        NSLog(@"Cell is nil!");
        return nil;
    }

    cell.textField.stringValue = node.title ?: @"(no title)";
    

    return cell;
}

@end
