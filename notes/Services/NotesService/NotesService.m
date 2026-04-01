//
//  NotesService.m
//  notes
//
//  Created by macmini 2 on 30/3/26.
//

#import "NotesService.h"
#import "AppDelegate.h"

@implementation NotesService

- (NSManagedObjectContext *)getContext {
    AppDelegate * delegate = (AppDelegate *) NSApp.delegate;
    return delegate.persistentContainer.viewContext;
}

- (void)logErrorIfExist:(NSError*) error {
    if (error) NSLog(@"Fetch folders error: %@", error);
}

- (void)saveContext {
    [[self getContext] save:nil];
}

- (Folder *)getOrCreateRootFolder {
    NSManagedObjectContext *context = [self getContext];

    NSFetchRequest<Folder *> *request = [Folder fetchRequest];
    request.predicate = [NSPredicate predicateWithFormat:@"isHiddenRoot == YES"];
    request.fetchLimit = 1;

    NSError *error = nil;
    NSArray<Folder *> *results = [context executeFetchRequest:request error:&error];
    [self logErrorIfExist:error];

    Folder *root = results.firstObject;
    if (root) return root;

    // create first-time root
    root = [NSEntityDescription 
            insertNewObjectForEntityForName:@"Folder"
            inManagedObjectContext:context];
    root.title = @"__ROOT__";
    root.isHiddenRoot = YES;

    [context save:&error];
    [self logErrorIfExist:error];
    return root;
}

- (NSArray *)childrenForFolder:(Folder *)folder {
    NSMutableArray *children = [NSMutableArray array];
    [children addObjectsFromArray:folder.childFolders.array];
    [children addObjectsFromArray:folder.notes.array];
    return children;
}

- (NSArray *)getRootItems {
    Folder *root = [self getOrCreateRootFolder];

    NSMutableArray *items = [NSMutableArray array];
    [items addObjectsFromArray:root.childFolders.array];
    [items addObjectsFromArray:root.notes.array];

    return items;
}

- (void)assignRootAsParentToItem:(id<FolderContainable>)item {
    Folder * root = [self getOrCreateRootFolder];
    if([item isMemberOfClass:[Note class]]) {
        Note * cast = (Note*) item;
        cast.parentFolder = root;
    }
    if([item isMemberOfClass:[Folder class]]) {
        Folder * cast = (Folder*) item;
        cast.parentFolder = root;
    }
    [self saveContext];
}

- (void)moveItem:(id<FolderContainable>)item toParent:(Folder *) targetFolder {
    item.parentFolder = targetFolder;
    return [self saveContext];
}

- (id)getManagedObjectWithManagedObjectIdUri:(NSURL *)uri {
    NSManagedObjectContext * context = [self getContext];
    NSManagedObjectID * objectID =
        [context.persistentStoreCoordinator
         managedObjectIDForURIRepresentation:uri];
    return [context objectWithID:objectID];
}

- (Folder *)createFolderWithTitle:(NSString *)title inFolder:(Folder * _Nullable) folder {
    Folder *targetFolder = folder ?: [self getOrCreateRootFolder];
    NSManagedObjectContext *context = targetFolder.managedObjectContext;

    Folder *newFolder = [NSEntityDescription
                         insertNewObjectForEntityForName:@"Folder"
                         inManagedObjectContext:context];
    newFolder.title = title;
    newFolder.parentFolder = targetFolder;

    NSError *error = nil;
    [context save:&error];
    [self logErrorIfExist:error];
    
    return newFolder;
}

- (void)deleteFolderEntity:(Folder *)folder {
    NSManagedObjectContext * context = folder.managedObjectContext;
    [context deleteObject:folder];
}

- (Note*)createNoteWithTitle:(NSString *)title
                    inFolder:(Folder * _Nullable)folder
                      atPath:(NSString *)path
{
    Folder *targetFolder = folder ?: [self getOrCreateRootFolder];
    NSManagedObjectContext *context = targetFolder.managedObjectContext;

    Note *newNote = [NSEntityDescription
                     insertNewObjectForEntityForName:@"Note"
                     inManagedObjectContext:context];
    newNote.title = title;
    newNote.parentFolder = targetFolder;
    newNote.contentPath = path;

    NSError *error = nil;
    [context save:&error];
    [self logErrorIfExist:error];
    return newNote;
}

- (void)deleteNoteEntity:(Note *)note {
    NSManagedObjectContext * context = note.managedObjectContext;
    NSError * error = nil;
    [context deleteObject:note];
    [context save:&error];
    [self logErrorIfExist:error];
}

- (void)renameNote:(Note *)note title:(NSString *)title {
    note.title = title;
    NSError * error = [NSError new];
    [note.managedObjectContext save:&error];
    [self logErrorIfExist:error];
}

- (void)renameFolder:(Folder *)folder title:(NSString *)title {
    folder.title = title;
    NSError * error = [NSError new];
    [folder.managedObjectContext save:&error];
    [self logErrorIfExist:error];
}

@end


