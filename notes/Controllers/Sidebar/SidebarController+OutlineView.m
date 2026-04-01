//
//  SidebarController+OutlineView.m
//  notes
//
//  Created by macmini 2 on 30/3/26.
//
#import "SidebarController.h"
#import "SidebarController+OutlineView.h"
#import <Cocoa/Cocoa.h>
#import "FolderContainable.h"

@implementation SidebarController (OutlineView)

- (NSInteger)outlineView:(NSOutlineView *)outlineView
  numberOfChildrenOfItem:(id)item
{
    if (item == nil)
        return self.rootItems.count;

    if ([item isKindOfClass:[Folder class]])
        return [self childrenForFolder:(Folder *)item].count;

    return 0;
}

- (id)outlineView:(NSOutlineView *)outlineView
            child:(NSInteger)index
           ofItem:(id)item
{
    if (item == nil)
        return self.rootItems[index];

    if ([item isKindOfClass:[Folder class]]) {
        NSArray *children = [self childrenForFolder:(Folder *)item];
        return children[index];
    }

    return nil;
}

- (BOOL)outlineView:(NSOutlineView *)outlineView
   isItemExpandable:(id)item
{
    if ([item isKindOfClass:[Folder class]]) {
        Folder *folder = (Folder *)item;
        return folder.childFolders.count > 0 || folder.notes.count > 0;
    }

    return NO;
}

- (NSArray *)childrenForFolder:(Folder *)folder {
    NSMutableArray *children = [NSMutableArray array];
    [children addObjectsFromArray:folder.childFolders.array];
    [children addObjectsFromArray:folder.notes.array];
    return children;
}

- (NSView *)outlineView:(NSOutlineView *)outlineView
    viewForTableColumn:(NSTableColumn *)tableColumn
                  item:(id)item
{
    NSString *title = nil;
    NSImage *icon = nil;

    if ([item isKindOfClass:[Folder class]]) {
        Folder *folder = (Folder *)item;
        title = folder.title;
        icon = [NSImage imageNamed:NSImageNameFolder];
    }
    else if ([item isKindOfClass:[Note class]]) {
        Note *note = (Note *)item;
        title = note.title;
        icon = [NSImage imageNamed:NSImageNameMultipleDocuments];
    }

    NSTableCellView *cell =
        [outlineView makeViewWithIdentifier:@"Cell" owner:self];

    if (!cell) return nil;
    cell.textField.stringValue = title ?: @"(no title)";
    cell.imageView.image = icon;

    return cell;
}

- (id<NSPasteboardWriting>)outlineView:(NSOutlineView *)outlineView
               pasteboardWriterForItem:(id)item
{
    NSPasteboardItem *pbItem = [[NSPasteboardItem alloc] init];

    if ([item isKindOfClass:[Note class]]) {
        Note *note = (Note *)item;
        NSString *uri = note.objectID.URIRepresentation.absoluteString;
        [pbItem setString:uri forType:NotePasteboardType];
    }
    else if ([item isKindOfClass:[Folder class]]) {
        Folder *folder = (Folder *)item;
        NSString *uri = folder.objectID.URIRepresentation.absoluteString;
        [pbItem setString:uri forType:FolderPasteboardType];
    }

    return pbItem;
}

- (NSDragOperation)outlineView:(NSOutlineView *)outlineView
                  validateDrop:(id<NSDraggingInfo>)info
                  proposedItem:(id)item
            proposedChildIndex:(NSInteger)index {
    return NSDragOperationMove;
}

- (BOOL)outlineView:(NSOutlineView *)outlineView
         acceptDrop:(id<NSDraggingInfo>)info
               item:(id)item
         childIndex:(NSInteger)index {
    NSPasteboard * pb = [info draggingPasteboard];
    NSString *uriString = [pb stringForType:NotePasteboardType];
    BOOL droppedItemIsNote = YES;

    if (!uriString) {
        uriString = [pb stringForType:FolderPasteboardType];
        droppedItemIsNote = NO;
    }
    if (!uriString) return NO;
    
    NSURL * url = [NSURL URLWithString:uriString];
    NSManagedObject * object = [self.noteService
                                getManagedObjectWithManagedObjectIdUri:url];
    
    id<FolderContainable> droppedItem;
    if (droppedItemIsNote)
        droppedItem = (Note *) object;
    else droppedItem = (Folder *) object;
        
    if ([item isKindOfClass:[Folder class]])
        [self.noteService moveItem:droppedItem toParent:item];
    else if ([item isKindOfClass:[Note class]])
        [self.noteService
         moveItem: droppedItem
         toParent: ((Note *)item).parentFolder ];
    else if (item == nil)
        [self.noteService assignRootAsParentToItem:droppedItem];
    
    self.rootItems = [self.noteService getRootItems];
    [self.outlineView reloadData];
    
    if ([item isKindOfClass:[Folder class]])
        [self.outlineView expandItem:item];
    NSInteger droppedItemRow = [self.outlineView rowForItem:droppedItem];
    [self.outlineView selectRowIndexes:[NSIndexSet
                                        indexSetWithIndex:droppedItemRow]
                  byExtendingSelection:NO];
    [self.outlineView scrollRowToVisible:droppedItemRow];
    
    return YES;
}

@end
