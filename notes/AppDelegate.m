//
//  AppDelegate.m
//  notes
//
//  Created by macmini 2 on 20/3/26.
//

#import "AppDelegate.h"
#import "AppWindowController.h"
#import "PreferenceWindowController.h"

@interface AppDelegate ()

@property (strong) AppWindowController *mainWC;
@property (strong) PreferenceWindowController *prefWC;

@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    _mainWC = [[AppWindowController alloc] init];
    [self.mainWC showWindow:self];
}


- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}


- (BOOL)applicationSupportsSecureRestorableState:(NSApplication *)app {
    return YES;
}


- (IBAction)preferenceMenuItemSelected:(id)sender {
    NSLog(@"%@", @"Okay");
    _prefWC = [[PreferenceWindowController alloc] init];
    [_prefWC showWindow:self];
}

@end
