//
//  AppDelegate.m
//  notes
//
//  Created by macmini 2 on 20/3/26.
//

#import "AppDelegate.h"
#import "AppRootController.h"

@interface AppDelegate ()

@property (strong) AppRootController *mainWC;
@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    _mainWC = [[AppRootController alloc] init];
    [self.mainWC showWindow:self];
}


- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}


- (BOOL)applicationSupportsSecureRestorableState:(NSApplication *)app {
    return YES;
}


@end
