//
//  Note+CoreDataClass.m
//  notes
//
//  Created by macmini 2 on 30/3/26.
//
//

#import "Note+CoreDataClass.h"

@implementation Note

- (NSString *)description {
    return [NSString stringWithFormat:@"<Note: title=%@, parent=%@>",
            self.title, self.parentFolder];
}

@end
