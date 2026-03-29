//
//  MainWindowController.m
//  notes
//
//  Created by macmini 2 on 20/3/26.
//

#import <Foundation/Foundation.h>
#import "AppDelegate.h"
#import <Cocoa/Cocoa.h>
#import "AppWindowController.h"
#import "MainSplitViewController.h"

@implementation AppWindowController

- (instancetype)init {
    self = [super initWithWindowNibName:@"AppWindow"];
    return self;
}

- (void)windowDidLoad {
    [super windowDidLoad];

    MainSplitViewController *splitVC = [[MainSplitViewController alloc] init];
    self.window.contentViewController = splitVC;
    
    NSPersistentContainer *container = ((AppDelegate *)NSApp.delegate).persistentContainer;
    
    NSManagedObjectContext *context = container.viewContext;

    NSManagedObject *note = [NSEntityDescription
                             insertNewObjectForEntityForName:@"Note"
                             inManagedObjectContext:context];

    [note setValue:@"Test Note" forKey:@"title"];
    [note setValue:@"Hello world" forKey:@"content"];
    [note setValue:[NSDate date] forKey:@"createdAt"];
    
    [context save:nil];
    
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Note"];

    NSArray *results = [context executeFetchRequest:request error:nil];

    for (NSManagedObject *note in results) {
        NSLog(@"ID: %@ \nTitle: %@ \nContent: %@", [note valueForKey:@"objectID"], [note valueForKey:@"title"], [note valueForKey:@"content"]);
    }
}

- (IBAction)preferenceMenuItemSelected:(id)sender {
}
@end
