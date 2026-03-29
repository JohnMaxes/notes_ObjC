//
//  AppDelegate.h
//  notes
//
//  Created by macmini 2 on 20/3/26.
//

#import <Cocoa/Cocoa.h>

@interface AppDelegate : NSObject <NSApplicationDelegate>

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (IBAction)preferenceMenuItemSelected:(id)sender;

@end

