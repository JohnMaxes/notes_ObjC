//
//  SplitViewController.m
//  notes
//
//  Created by macmini 2 on 20/3/26.
//
#import "MainSplitViewController.h"
#import "ContentViewController.h"
#import "NavigatorController.h"
#import <Cocoa/Cocoa.h>

@implementation MainSplitViewController

-(void)viewDidLoad {
    [super viewDidLoad];

    NavigatorController *navVC = [[NavigatorController alloc] init];
    ContentViewController *contentVC = [[ContentViewController alloc] init];

    NSSplitViewItem *sidebarItem =
        [NSSplitViewItem sidebarWithViewController:navVC];

    NSSplitViewItem *contentItem =
        [NSSplitViewItem splitViewItemWithViewController:contentVC];

    [self addSplitViewItem:sidebarItem];
    [self addSplitViewItem:contentItem];
}

@end
