//
//  Folder+CoreDataClass.m
//  notes
//
//  Created by macmini 2 on 30/3/26.
//
//

#import "Folder+CoreDataClass.h"

@implementation Folder

- (NSString *)description {
    return [NSString stringWithFormat:
        @"<Folder: title=%@, parent=%@, childFolderCount=%lu, noteCount=%lu>",
        self.title,
        self.parentFolder.title ?: @"nil",
        (unsigned long)self.childFolders.count,
        (unsigned long)self.notes.count];
}


@end
