//
//  NoteNode.h
//  notes
//
//  Created by macmini 2 on 20/3/26.
//
#import <Foundation/Foundation.h>

@interface NoteNode : NSObject

@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *content;
@property (strong) NSMutableArray<NoteNode *> *children;

@property (nonatomic, copy, readonly) NSString *identifier;
+ (NSMutableArray<NoteNode *>*)getMock;

@end
