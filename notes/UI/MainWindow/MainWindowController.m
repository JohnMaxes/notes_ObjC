//
//  MainWindowController.m
//  notes
//
//  Created by macmini 2 on 20/3/26.
//

#import <Foundation/Foundation.h>
#import <Cocoa/Cocoa.h>
#import "MainWindowController.h"
#import "MainSplitViewController.h"

@implementation MainWindowController

- (instancetype)init {
    self = [super initWithWindowNibName:@"MainWindow"];
    return self;
}

- (void)windowDidLoad {
    [super windowDidLoad];

    MainSplitViewController *splitVC = [[MainSplitViewController alloc] init];
    self.window.contentViewController = splitVC;
}

@end
