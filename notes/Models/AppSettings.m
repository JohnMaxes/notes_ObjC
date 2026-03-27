//
//  AppSettings.m
//  notes
//
//  Created by macmini 2 on 27/3/26.
//
#import "AppSettings.h"
@implementation AppSettings

+ (instancetype)shared {
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
        NSInteger value = [[NSUserDefaults standardUserDefaults] integerForKey:@"app_theme"];
        _theme = (AppTheme)value;
    }
    return self;
}

-(void)setAppTheme:(AppTheme) theme {
    _theme = (AppTheme)theme;
    [[NSUserDefaults standardUserDefaults] setInteger:theme forKey:@"app_theme"];
}

@end
