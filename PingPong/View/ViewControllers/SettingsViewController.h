//
//  SettingsViewController.h
//  PingPong
//
//  Created by Igor on 07/04/2019.
//  Copyright © 2019 Igor. All rights reserved.
//


#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>


@class SettingsViewController;
@protocol SliderValueDelegate <NSObject>

- (void)passSliderValueFromSettings:(CGFloat)value;

@end


@interface SettingsViewController : UIViewController

@property (nonatomic, weak) id <SliderValueDelegate> complexityDelegate;

@end
