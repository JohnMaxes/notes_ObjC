//
//  Folder+CoreDataProperties.h
//  notes
//
//  Created by macmini 2 on 30/3/26.
//
//

#import "Folder+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface Folder (CoreDataProperties)

+ (NSFetchRequest<Folder *> *)fetchRequest NS_SWIFT_NAME(fetchRequest());

@property (nullable, nonatomic, copy) NSDate *createdAt;
@property (nullable, nonatomic, copy) NSString *title;
@property (nonatomic) BOOL isHiddenRoot;
@property (nullable, nonatomic, retain) NSOrderedSet<Folder *> *childFolders;
@property (nullable, nonatomic, retain) NSOrderedSet<Note *> *notes;
@property (nullable, nonatomic, retain) Folder *parentFolder;

@end

@interface Folder (CoreDataGeneratedAccessors)

- (void)insertObject:(Folder *)value inChildFoldersAtIndex:(NSUInteger)idx;
- (void)removeObjectFromChildFoldersAtIndex:(NSUInteger)idx;
- (void)insertChildFolders:(NSArray<Folder *> *)value atIndexes:(NSIndexSet *)indexes;
- (void)removeChildFoldersAtIndexes:(NSIndexSet *)indexes;
- (void)replaceObjectInChildFoldersAtIndex:(NSUInteger)idx withObject:(Folder *)value;
- (void)replaceChildFoldersAtIndexes:(NSIndexSet *)indexes withChildFolders:(NSArray<Folder *> *)values;
- (void)addChildFoldersObject:(Folder *)value;
- (void)removeChildFoldersObject:(Folder *)value;
- (void)addChildFolders:(NSOrderedSet<Folder *> *)values;
- (void)removeChildFolders:(NSOrderedSet<Folder *> *)values;

- (void)insertObject:(Note *)value inNotesAtIndex:(NSUInteger)idx;
- (void)removeObjectFromNotesAtIndex:(NSUInteger)idx;
- (void)insertNotes:(NSArray<Note *> *)value atIndexes:(NSIndexSet *)indexes;
- (void)removeNotesAtIndexes:(NSIndexSet *)indexes;
- (void)replaceObjectInNotesAtIndex:(NSUInteger)idx withObject:(Note *)value;
- (void)replaceNotesAtIndexes:(NSIndexSet *)indexes withNotes:(NSArray<Note *> *)values;
- (void)addNotesObject:(Note *)value;
- (void)removeNotesObject:(Note *)value;
- (void)addNotes:(NSOrderedSet<Note *> *)values;
- (void)removeNotes:(NSOrderedSet<Note *> *)values;

@end

NS_ASSUME_NONNULL_END
