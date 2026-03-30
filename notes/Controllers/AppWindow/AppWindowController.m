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
    
    // spawn container
    ((AppDelegate *) NSApp.delegate).persistentContainer;
}

- (IBAction)preferenceMenuItemSelected:(id)sender {
}
@end
