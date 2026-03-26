//
//  SplitView.h
//  notes
//
//  Created by macmini 2 on 20/3/26.
//

#import <Cocoa/Cocoa.h>
#import "SidebarController.h"
#import "ContentViewController.h"

@interface MainSplitViewController : NSSplitViewController <SidebarDelegate>

@property (strong) SidebarController * sidebarVC;
@property (strong) ContentViewController * contentVC;

@end
