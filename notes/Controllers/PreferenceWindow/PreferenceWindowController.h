//
//  PreferenceWindowController.h
//  notes
//
//  Created by macmini 2 on 27/3/26.
//
#import <Cocoa/Cocoa.h>
#import "AppSettings.h"

@interface PreferenceWindowController : NSWindowController

@property IBOutlet NSPopUpButton * themePopup;
@property (weak) AppSettings * settings;
-(IBAction)themeChanged:(NSPopUpButton *)sender;

@end
