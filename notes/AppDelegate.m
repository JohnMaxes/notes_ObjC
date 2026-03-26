//
//  AppDelegate.m
//  notes
//
//  Created by macmini 2 on 20/3/26.
//

#import "AppDelegate.h"
#import "AppWindowController.h"

@interface AppDelegate ()

@property (strong) AppWindowController *mainWC;
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


@end
