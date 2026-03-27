//
//  AppSettings.h
//  notes
//
//  Created by macmini 2 on 27/3/26.
//
#import <Cocoa/Cocoa.h>

typedef NS_ENUM(NSInteger, AppTheme) {
    AppThemeSystem = 0,
    AppThemeLight,
    AppThemeDark
};

@interface AppSettings : NSObject

+(instancetype)shared;

@property (nonatomic) AppTheme theme;
-(void)setAppTheme:(AppTheme)theme;

@end
