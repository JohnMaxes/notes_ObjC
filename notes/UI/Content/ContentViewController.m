//
//  ContentViewController.m
//  notes
//
//  Created by macmini 2 on 20/3/26.
//

#import <Cocoa/Cocoa.h>
#import "ContentViewController.h"

@implementation ContentViewController

- (instancetype)init {
    self = [super initWithNibName:@"Content" bundle:NULL];
    return self;
}

- (void)viewDidLoad {
    
}

-(void)awakeFromNib {
    _scrollView.wantsLayer = YES;
    _scrollView.layer.cornerRadius = 8;
    _scrollView.layer.borderWidth = 1;
}

@end
