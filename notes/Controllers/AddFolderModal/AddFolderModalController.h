//
//  AddFolderModalControler.h
//  notes
//
//  Created by macmini 2 on 30/3/26.
//
#import <Cocoa/Cocoa.h>

@protocol AddFolderDelegate <NSObject>

-(void)onCreateFolderWithTitle:(NSString*) title;

@end

@interface AddFolderModalController : NSViewController



@end
