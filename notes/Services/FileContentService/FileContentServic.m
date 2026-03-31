//
//  Untitled.swift
//  notes
//
//  Created by macmini 2 on 30/3/26.
//

#import "FileContentService.h"
#import <Cocoa/Cocoa.h>

@interface FileContentService ()

@property (atomic, strong) NSString * basePath;

@end

@implementation FileContentService

- (instancetype)init {
    self = [super init];
    [self initFolderAndPath];
    return self;
}

- (void)initFolderAndPath {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSApplicationSupportDirectory, NSUserDomainMask, YES);
    self.basePath = [paths.firstObject stringByAppendingPathComponent:@"notes"];
    NSLog(@"%@", self.basePath);
    [[NSFileManager defaultManager] createDirectoryAtPath:self.basePath
                              withIntermediateDirectories:YES
                                               attributes:nil
                                                    error:nil];
}

- (NSString *)createNoteFile {
    NSString *uuid = [[NSUUID UUID] UUIDString];
    NSString *filePath = [self.basePath stringByAppendingPathComponent:
                          [uuid stringByAppendingString:@".rtfd"]];

    NSAttributedString *empty = [[NSAttributedString alloc] initWithString:@""];

    NSError *error = nil;
    NSFileWrapper *wrapper =
        [empty fileWrapperFromRange:NSMakeRange(0, empty.length)
                 documentAttributes:@{
                    NSDocumentTypeDocumentAttribute: NSRTFDTextDocumentType
                 }
                              error:&error];

    if (!wrapper) {
        NSLog(@"Failed to create file wrapper: %@", error);
        return nil;
    }

    BOOL success = [wrapper writeToURL:[NSURL fileURLWithPath:filePath]
                               options:NSFileWrapperWritingAtomic
                   originalContentsURL:nil
                                 error:&error];

    if (!success) {
        NSLog(@"Failed to write RTFD: %@", error);
        return nil;
    }

    return filePath;
}

- (NSAttributedString *)readNoteFileAtPath:(NSString *)filePath {
    NSURL *url = [NSURL fileURLWithPath:filePath];
    NSError *error = nil;
    NSFileWrapper *wrapper = [[NSFileWrapper alloc] initWithURL:url
                                                        options:0
                                                          error:&error];
    
    if (!wrapper) {
        NSLog(@"Failed to read wrapper: %@", error);
        return [[NSAttributedString alloc] initWithString:@""];
    }

    NSAttributedString *content = [[NSAttributedString alloc]
                                   initWithRTFDFileWrapper:wrapper
                                   documentAttributes:nil];
    
    if (!content) {
        NSLog(@"Failed to parse attributed string: %@", error);
        return [[NSAttributedString alloc] initWithString:@""];
    }

    return content;
}

- (void)deleteFileAtPath:(NSString *)data {
    
}

- (BOOL)saveNoteContent:(NSAttributedString *)content
                 toPath:(NSString *)filePath {
    NSError *error = nil;

    NSFileWrapper *wrapper =
        [content fileWrapperFromRange:NSMakeRange(0, content.length)
                   documentAttributes:@{
                      NSDocumentTypeDocumentAttribute: NSRTFDTextDocumentType
                   }
                                error:&error];

    if (!wrapper) {
        NSLog(@"Failed to create wrapper for save: %@", error);
        return NO;
    }

    BOOL success = [wrapper writeToURL:[NSURL fileURLWithPath:filePath]
                               options:NSFileWrapperWritingAtomic
                   originalContentsURL:nil
                                 error:&error];

    if (!success) NSLog(@"Failed to save note: %@", error);
    return success;
}

@end
