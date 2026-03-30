//
//  Note+CoreDataProperties.h
//  notes
//
//  Created by macmini 2 on 30/3/26.
//
//

#import "Note+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface Note (CoreDataProperties)

+ (NSFetchRequest<Note *> *)fetchRequest NS_SWIFT_NAME(fetchRequest());

@property (nullable, nonatomic, copy) NSString *contentPath;
@property (nullable, nonatomic, copy) NSString *title;
@property (nullable, nonatomic, copy) NSDate *createdAt;
@property (nullable, nonatomic, retain) Folder *parentFolder;

@end

NS_ASSUME_NONNULL_END
