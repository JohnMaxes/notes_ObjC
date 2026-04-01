//
//  FolderContainable.h
//  notes
//
//  Created by macmini 2 on 1/4/26.
//
#import <Foundation/Foundation.h>

@protocol FolderContainable <NSObject>
@property (nullable, nonatomic, retain) id parentFolder;
@end
