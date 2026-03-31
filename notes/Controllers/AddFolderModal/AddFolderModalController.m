//
//  AddFolderModalController.m
//  notes
//
//  Created by macmini 2 on 30/3/26.
//
#import "AddFolderModalController.h"

@implementation AddFolderModalController

- (instancetype)init {
    self = [super initWithNibName:@"AddFolderModal" bundle:NULL];
    return self;
}

-(void)createButtonPressed:(id)sender {
    NSString * title = _titleTextField.stringValue;
    
    if (![title isEqualToString:@""]) {
        [self.delegate onCreateFolderWithTitle:title];
        [self dismissViewController:self];
    }
}

- (void)cancelButtonPressed:(id)sender {
    [self dismissViewController:self];
}

@end
