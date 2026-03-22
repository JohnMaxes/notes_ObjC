//
//  NoteNode.m
//  notes
//
//  Created by macmini 2 on 20/3/26.
//
#import "NoteNode.h"

@implementation NoteNode

+ (NSArray<NoteNode *>*)getMock {
    // Create sample data
    NoteNode *work = [NoteNode new];
    work.title = @"Work";
    work.children = [NSMutableArray array];

    NoteNode *personal = [NoteNode new];
    personal.title = @"Personal";
    personal.children = [NSMutableArray array];

    NoteNode *note1 = [NoteNode new];
    note1.title = @"Meeting Notes";
    note1.content = @"Discuss project timeline";
    note1.children = [NSMutableArray array];

    NoteNode *note2 = [NoteNode new];
    note2.title = @"Ideas";
    note2.content = @"Build a macOS notes app";
    note2.children = [NSMutableArray array];

    NoteNode *note3 = [NoteNode new];
    note3.title = @"Shopping List";
    note3.content = @"Milk, Eggs, Coffee";
    note3.children = [NSMutableArray array];
    
    [work.children addObject:note1];
    [work.children addObject:note2];
    [personal.children addObject:note3];
    
    return [NSMutableArray arrayWithArray:@[work, personal]];
};

@end
