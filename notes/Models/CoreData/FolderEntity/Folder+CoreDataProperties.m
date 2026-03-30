//
//  Folder+CoreDataProperties.m
//  notes
//
//  Created by macmini 2 on 30/3/26.
//
//

#import "Folder+CoreDataProperties.h"

@implementation Folder (CoreDataProperties)

+ (NSFetchRequest<Folder *> *)fetchRequest {
	return [NSFetchRequest fetchRequestWithEntityName:@"Folder"];
}

@dynamic createdAt;
@dynamic title;
@dynamic isHiddenRoot;
@dynamic childFolders;
@dynamic notes;
@dynamic parentFolder;

@end
