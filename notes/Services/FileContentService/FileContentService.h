//
//  FileContentService.h
//  notes
//
//  Created by macmini 2 on 30/3/26.
//
#import "Cocoa/Cocoa.h"

@interface FileContentService : NSObject

-(NSString *)createNoteFile;
-(BOOL)saveNoteContent:(NSAttributedString *)content
                toPath:(NSString *)filePath;
-(void)deleteFileAtPath:(NSString*)data;
-(NSAttributedString *)readNoteFileAtPath:(NSString *)filePath;

@end
