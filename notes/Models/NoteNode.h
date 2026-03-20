//
//  NoteNode.h
//  notes
//
//  Created by macmini 2 on 20/3/26.
//
#import <Foundation/Foundation.h>

@interface NoteNode : NSObject

@property (strong) NSString *title;
@property (strong) NSMutableArray<NoteNode *> *children;
@property (strong) NSString *content;

@end
