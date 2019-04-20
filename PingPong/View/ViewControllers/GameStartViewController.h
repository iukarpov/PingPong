//
//  ViewController.h
//  PingPong
//
//  Created by Igor on 04/04/2019.
//  Copyright © 2019 Igor. All rights reserved.
//


#import <UIKit/UIKit.h>
#import "SettingsViewController.h"
#import "GamePresenter.h"
#import "GameProtocol.h"
#import "SettingsAnimationController.h"
#import "SettingsViewController.h"
#import "GameContainerView.h"


@class GamePresenter;
@interface GameStartViewController : UIViewController <GameProtocol>

@property (nonatomic, strong) GamePresenter *presenter;


@end

