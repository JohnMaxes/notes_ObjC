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

-(instancetype)init {
    self = [super init];
    _navVC = [[NavigatorController alloc] init];
    _navVC.delegate = self;
    _contentVC = [[ContentViewController alloc] init];
    
    return self;
}

-(void)viewDidLoad {
    [super viewDidLoad];

    NSSplitViewItem *sidebarItem =
        [NSSplitViewItem sidebarWithViewController:_navVC];
    NSSplitViewItem *contentItem =
        [NSSplitViewItem splitViewItemWithViewController:_contentVC];

    [self addSplitViewItem:sidebarItem];
    [self addSplitViewItem:contentItem];
}

-(void)noteSelected:(NoteNode*)note {
    [_contentVC displayContentWithNote:note];
}

@end
