//
//  Folder+CoreDataClass.h
//  notes
//
//  Created by macmini 2 on 30/3/26.
//
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "FolderContainable.h"

@class Note;

NS_ASSUME_NONNULL_BEGIN

@interface Folder : NSManagedObject <FolderContainable>

@end

NS_ASSUME_NONNULL_END

#import "Folder+CoreDataProperties.h"
