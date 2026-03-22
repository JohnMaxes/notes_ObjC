//
//  SplitView.h
//  notes
//
//  Created by macmini 2 on 20/3/26.
//

#import <Cocoa/Cocoa.h>
#import "NavigatorController.h"
#import "ContentViewController.h"

@interface MainSplitViewController : NSSplitViewController <NavigatorDelegate>

@property (strong) NavigatorController * navVC;
@property (strong) ContentViewController * contentVC;

@end
