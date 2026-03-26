//
//  NavigatorController.m
//  notes
//
//  Created by macmini 2 on 20/3/26.
//
#import <Cocoa/Cocoa.h>
#import "NoteNode.h"
#import "SidebarController.h"
#import "AddNoteModal.h"

@implementation SidebarController

- (instancetype)init
{
    self = [super initWithNibName:@"Navigator" bundle:NULL];
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.rootNodes = [NoteNode getMock];
    self.outlineView.dataSource = self;
    self.outlineView.delegate = self;
    [self.outlineView reloadData];
    
    [self.rootNodes.]
    [self.rootNodes addObserver:self
                forKeyPath:@"title"
                   options:NSKeyValueObservingOptionNew
                   context:nil];
}

- (NSInteger)outlineView:(NSOutlineView *)outlineView
  numberOfChildrenOfItem:(id)item
{
    if (item == nil)
        return self.rootNodes.count; // top-level
    NoteNode *node = (NoteNode *)item;
    return node.children.count;
};

- (id)outlineView:(NSOutlineView *)outlineView
            child:(NSInteger)index
           ofItem:(id)item
{
    if (item == nil)
        return self.rootNodes[index];

    NoteNode *node = (NoteNode *)item;
    return node.children[index];
}

// Expandable check
- (BOOL)outlineView:(NSOutlineView *)outlineView
   isItemExpandable:(id)item
{
    NoteNode *node = (NoteNode *)item;
    return node.children.count > 0;
}

- (NSView *)outlineView:(NSOutlineView *)outlineView
    viewForTableColumn:(NSTableColumn *)tableColumn
                  item:(id)item
{
    NoteNode *node = (NoteNode *)item;
    NSTableCellView *cell = [outlineView makeViewWithIdentifier:@"Cell" owner:self];
    if (!cell) return nil;
    cell.textField.stringValue = node.title ?: @"(no title)";
    return cell;
}

- (void)outlineViewSelectionDidChange:(NSNotification *)notification
{
    NSInteger row = _outlineView.selectedRow;
    if (row == -1) return;
    NoteNode *selectedNode = [_outlineView itemAtRow:row];
    NSLog(@"Selected note: %p title: %@ content: %@", selectedNode, selectedNode.title, selectedNode.content);
    if(selectedNode.content != nil)
        [_delegate noteSelected:selectedNode];
}

- (void)addButtonPressed:(id) sender {
    AddNoteModal * addNoteModal = [[AddNoteModal alloc] init];
    addNoteModal.delegate = self;
    [self presentViewControllerAsSheet:addNoteModal];
}

- (void)onCreateNote:(NoteNode *)note {
    NSInteger selectedRow = _outlineView.selectedRow;
    if(selectedRow == -1) [self.rootNodes addObject:note];
    else {
        NoteNode *selectedNode = [_outlineView itemAtRow:selectedRow];
        [selectedNode.children addObject:note];
    }
    [_outlineView reloadData];
}

@end
