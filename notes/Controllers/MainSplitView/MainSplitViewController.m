//
//  SplitViewController.m
//  notes
//
//  Created by macmini 2 on 20/3/26.
//
#import "MainSplitViewController.h"
#import "ContentViewController.h"
#import "SidebarController.h"
#import <Cocoa/Cocoa.h>

@implementation MainSplitViewController

-(instancetype)init {
    self = [super init];
    _sidebarVC = [[SidebarController alloc] init];
    _sidebarVC.delegate = self;
    _contentVC = [[ContentViewController alloc] init];
    
    return self;
}

-(void)viewDidLoad {
    [super viewDidLoad];

    NSSplitViewItem *sidebarItem =
        [NSSplitViewItem sidebarWithViewController:_sidebarVC];
    NSSplitViewItem *contentItem =
        [NSSplitViewItem splitViewItemWithViewController:_contentVC];

    [self addSplitViewItem:sidebarItem];
    [self addSplitViewItem:contentItem];
}

-(void)noteSelected:(NoteNode*)note {
    [_contentVC displayContentWithNote:note];
}

@end
