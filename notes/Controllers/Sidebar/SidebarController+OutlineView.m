//
//  SidebarController+OutlineView.m
//  notes
//
//  Created by macmini 2 on 30/3/26.
//
#import "SidebarController.h"
#import "SidebarController+OutlineView.h"
#import <Cocoa/Cocoa.h>

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

// Expandable check
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

@end
