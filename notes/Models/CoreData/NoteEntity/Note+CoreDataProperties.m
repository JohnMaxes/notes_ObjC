//
//  Note+CoreDataProperties.m
//  notes
//
//  Created by macmini 2 on 30/3/26.
//
//

#import "Note+CoreDataProperties.h"

@implementation Note (CoreDataProperties)

+ (NSFetchRequest<Note *> *)fetchRequest {
	return [NSFetchRequest fetchRequestWithEntityName:@"Note"];
}

@dynamic contentPath;
@dynamic title;
@dynamic createdAt;
@dynamic parentFolder;

@end
