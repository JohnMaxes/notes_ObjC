//
//  NavigatorController.m
//  notes
//
//  Created by macmini 2 on 20/3/26.
//
#import <Cocoa/Cocoa.h>
#import "Folder+CoreDataClass.h"
#import "Note+CoreDataClass.h"
#import "SidebarController.h"
#import "AddNoteModalController.h"
#import "AddFolderModalController.h"

@implementation SidebarController

- (instancetype)init {
    self = [super initWithNibName:@"Sidebar" bundle:NULL];
    _noteService = [[NotesService alloc] init];
    _fileContentService = [[FileContentService alloc] init];
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadRootItems];
    _outlineView.dataSource = self;
    _outlineView.delegate = self;
    [_outlineView reloadData];
}

- (void)loadRootItems {
    self.rootItems = [_noteService getRootItems];
}

- (void)outlineViewSelectionDidChange:(NSNotification *)notification {
    NSInteger row = _outlineView.selectedRow;
    if (row == -1) return;
    id selectedItem = [_outlineView itemAtRow:row];
    
    if( [selectedItem isMemberOfClass: [Folder class]] ) return;
    if( [selectedItem isMemberOfClass: [Note class]] )
        [self.delegate noteSelected:selectedItem];
}

- (IBAction)delete:(id)sender {
    NSInteger row = self.outlineView.selectedRow;
    if (row == -1) return;

    id item = [self.outlineView itemAtRow:row];
    if (!item) return;
    
    if( [item isMemberOfClass: [Folder class]] )
        [self.noteService deleteFolderEntity:item];
    if( [item isMemberOfClass: [Note class]] ) {
        [self.delegate itemDeleted];
        Note * cast = (Note*)item;
        [self.fileContentService deleteFileAtPath:cast.contentPath];
        [self.noteService deleteNoteEntity:cast];
    }
    
    [self loadRootItems];
    [self.outlineView reloadData];
    
}

- (void)addButtonPressed:(id) sender {
    AddNoteModalController * addNoteModal = [[AddNoteModalController alloc] init];
    addNoteModal.delegate = self;
    [self presentViewControllerAsSheet:addNoteModal];
}

- (void)folderButtonPressed:(id)sender {
    AddFolderModalController * addFolderModal = [[AddFolderModalController alloc] init];
    addFolderModal.delegate = self;
    [self presentViewControllerAsSheet:addFolderModal];
}

- (Folder*)identifyTargetFolderOfIndex:(NSInteger)index {
    Folder *targetFolder = nil;
    if (index != -1) {
        id selectedItem = [_outlineView itemAtRow:index];

        if ([selectedItem isKindOfClass:[Folder class]]) {
            targetFolder = (Folder *)selectedItem;
        } else if ([selectedItem isKindOfClass:[Note class]]) {
            targetFolder = ((Note *)selectedItem).parentFolder;
        }
    }
    return targetFolder;
}

- (void)onCreateNoteWithTitle:(NSString *)title {
    NSInteger selectedRow = self.outlineView.selectedRow;
    Folder *targetFolder = [self identifyTargetFolderOfIndex:selectedRow];

    NSString *newPath = [self.fileContentService createNoteFile];
    Note *newNote = [self.noteService createNoteWithTitle:title
                                                 inFolder:targetFolder
                                                   atPath:newPath];

    if (targetFolder.parentFolder == nil) [self loadRootItems];
    else [self.outlineView expandItem:targetFolder];
    [self.outlineView reloadData];

    NSInteger row = [self.outlineView rowForItem:newNote];
    if (row != -1) {
        [self.outlineView selectRowIndexes:[NSIndexSet indexSetWithIndex:row]
                      byExtendingSelection:NO];
        [self.outlineView scrollRowToVisible:row];
    }
}

- (void)onCreateFolderWithTitle:(NSString *)title {
    NSInteger selectedRow = self.outlineView.selectedRow;
    Folder *targetFolder = [self identifyTargetFolderOfIndex:selectedRow];

    Folder *newFolder =
        [self.noteService createFolderWithTitle:title inFolder:targetFolder];

    if (targetFolder.parentFolder == nil) [self loadRootItems];
    else [self.outlineView expandItem:targetFolder];
    [self.outlineView reloadData];

    NSInteger row = [self.outlineView rowForItem:newFolder];
    if (row != -1) {
        [self.outlineView selectRowIndexes:[NSIndexSet indexSetWithIndex:row]
                      byExtendingSelection:NO];
        [self.outlineView scrollRowToVisible:row];
    }
}

@end
