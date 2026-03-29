//
//  AppSettings.m
//  notes
//
//  Created by macmini 2 on 27/3/26.
//
#import "AppSettings.h"
@implementation AppSettings

+ (instancetype)getShared {
    static AppSettings *instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[AppSettings alloc] init];
    });
    return instance;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        NSInteger theme = [[NSUserDefaults standardUserDefaults] integerForKey:@"app_theme"];
        _theme = (AppTheme)theme;
        [self changeAppearance:theme];
    }
    return self;
}

-(void)setAppTheme:(AppTheme) theme {
    _theme = (AppTheme)theme;
    [[NSUserDefaults standardUserDefaults] setInteger:theme forKey:@"app_theme"];
    [self changeAppearance:theme];
}

- (void)changeAppearance:(AppTheme)theme {
    NSAppearanceName name = NSAppearanceNameAqua;
    switch (theme) {
        case AppThemeSystem:
            [NSApp setAppearance:nil]; return;
        case AppThemeLight:
            name = NSAppearanceNameAqua; break;
        case AppThemeDark:
            name = NSAppearanceNameDarkAqua; break;
        default: break;
    }
    NSAppearance *appearance = [NSAppearance appearanceNamed:name];
    [NSApp setAppearance:appearance];
}


@end
