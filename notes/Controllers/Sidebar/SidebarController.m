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
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.rootItems = [_noteService getRootItems];
    _outlineView.dataSource = self;
    _outlineView.delegate = self;
    [_outlineView reloadData];
}

- (void)outlineViewSelectionDidChange:(NSNotification *)notification {
    NSInteger row = _outlineView.selectedRow;
    if (row == -1) return;
    id selectedItem = [_outlineView itemAtRow:row];
    
    if( [selectedItem isMemberOfClass: [Folder class]] ) {
        return;
    }
    if( [selectedItem isMemberOfClass: [Note class]] ) {
        Note * cast = (Note*) selectedItem;
        [self.delegate noteSelected:cast];
    }
}

- (void)addButtonPressed:(id) sender {
    AddNoteModal * addNoteModal = [[AddNoteModal alloc] init];
    addNoteModal.delegate = self;
    [self presentViewControllerAsSheet:addNoteModal];
}

- (void)folderButtonPressed:(id)sender {
    NSOpenPanel * panel = [NSOpenPanel openPanel];
    panel.canChooseFiles = YES;
    panel.canChooseDirectories = NO;
    panel.allowsMultipleSelection = NO;

    if ([panel runModal] == NSModalResponseOK) {
        NSURL *selectedFile = panel.URL;
        NSLog(@"Selected file: %@", selectedFile.path);
    }
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
    NSInteger selectedRow = _outlineView.selectedRow;
    Folder * targetFolder = [self identifyTargetFolderOfIndex:selectedRow];
    [self.noteService createNoteWithTitle:title inFolder:targetFolder];
    [_outlineView reloadData];
}

- (void)onCreateFolderWithTitle:(NSString *)title { 
    NSInteger selectedRow = _outlineView.selectedRow;
    Folder * targetFolder = [self identifyTargetFolderOfIndex:selectedRow];
    [self.noteService createFolderWithTitle:title inFolder:targetFolder];
    [_outlineView reloadData];
}

@end
