//
//  PreferenceWindowController.m
//  notes
//
//  Created by macmini 2 on 27/3/26.
//
#import "PreferenceWindowController.h"

@implementation PreferenceWindowController

- (instancetype)init {
    self = [super initWithWindowNibName:@"PreferenceWindow"];
    _settings = [AppSettings shared];
    NSLog(@"pref Win init");
    return self;
}

-(void)awakeFromNib {
    [super awakeFromNib];
    [self.themePopup removeAllItems];
    [self.themePopup addItemsWithTitles:@[@"Inherit from System", @"Light Theme", @"Dark Theme"]];
    [self.themePopup selectItemAtIndex:0];
}

-(void)windowDidLoad {
    [super windowDidLoad];
    NSLog(@"pref Win did load");
}

- (IBAction)themeChanged:(NSPopUpButton *)sender {
    NSInteger index = sender.indexOfSelectedItem;
    AppTheme theme = (AppTheme)index;
    [AppSettings shared].theme = theme;
    
    NSAppearance *darkAppearance = [NSAppearance appearanceNamed:NSAppearanceNameDarkAqua];
    [NSApp setAppearance:darkAppearance];
}

@end
