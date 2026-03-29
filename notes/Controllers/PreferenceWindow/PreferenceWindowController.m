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
    _settings = [AppSettings getShared];
    NSLog(@"pref Win init");
    return self;
}

-(void)awakeFromNib {
    [super awakeFromNib];
    [self initThemeSettings];
}

-(void)windowDidLoad {
    [super windowDidLoad];
    NSLog(@"pref Win did load");
}

- (void)initThemeSettings {
    [self.themePopup removeAllItems];

    NSMenuItem *system = [[NSMenuItem alloc] initWithTitle:@"Inherit from System" action:nil keyEquivalent:@""];
    system.tag = AppThemeSystem;

    NSMenuItem *light = [[NSMenuItem alloc] initWithTitle:@"Light Theme" action:nil keyEquivalent:@""];
    light.tag = AppThemeLight;

    NSMenuItem *dark = [[NSMenuItem alloc] initWithTitle:@"Dark Theme" action:nil keyEquivalent:@""];
    dark.tag = AppThemeDark;

    [_themePopup.menu addItem:system];
    [_themePopup.menu addItem:light];
    [_themePopup.menu addItem:dark];
    
    NSInteger selectedIndex =
        _settings.theme == AppThemeSystem ? 0
            : _settings.theme == AppThemeLight ? 1 : 2;
    
    [self.themePopup selectItemAtIndex:selectedIndex];
}

- (IBAction)themeChanged:(NSPopUpButton *)sender {
    AppTheme theme = (AppTheme)sender.selectedItem.tag;
    [_settings setAppTheme:theme];
}

@end
