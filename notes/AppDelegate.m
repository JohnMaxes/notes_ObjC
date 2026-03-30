//
//  AppDelegate.m
//  notes
//
//  Created by macmini 2 on 20/3/26.
//

#import "AppDelegate.h"
#import <CoreData/CoreData.h>
#import "AppWindowController.h"
#import "PreferenceWindowController.h"

@interface AppDelegate ()

@property (strong) AppWindowController *mainWC;
@property (strong) PreferenceWindowController *prefWC;

@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    [AppSettings getShared];

    _persistentContainer = [[NSPersistentContainer alloc] initWithName:@"Model"];

    [_persistentContainer loadPersistentStoresWithCompletionHandler:^(NSPersistentStoreDescription *desc, NSError *error) {
        if (error != nil) {
            NSLog(@"Unresolved error %@, %@", error, error.userInfo);
            abort();
        }

        NSLog(@"Core Data store path: %@", desc.URL.path);
    }];

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

- (void)saveContext {
    NSManagedObjectContext *context = self.persistentContainer.viewContext;
    
    if (context.hasChanges) {
        NSError *error = nil;
        [context save:&error];
        
        if (error != nil) {
            NSLog(@"Save error: %@", error);
            abort();
        }
    }
}

@end
