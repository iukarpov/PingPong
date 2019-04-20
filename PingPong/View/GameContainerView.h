//
//  GameContainerView.h
//  PingPong
//
//  Created by Igor on 12/04/2019.
//  Copyright © 2019 Igor. All rights reserved.
//


#import <UIKit/UIKit.h>


NS_ASSUME_NONNULL_BEGIN


@interface GameContainerView : UIView

@property (nonatomic, strong) UIView *ball;
@property (nonatomic, strong) UIView *gamerPlatformView;
@property (nonatomic, strong) UIView *enemyPlatformView;
@property (nonatomic,strong) UILabel *gamerScoreLabel;
@property (nonatomic,strong) UILabel *enemyScoreLabel;
@property (nonatomic, copy) NSArray *gameContainerViewArray;
@property (nonatomic, strong) UIButton *startButton;
@property (nonatomic, strong) UIButton *settingsButton;
@property (nonatomic, strong) UIButton *stopButton;

@end

NS_ASSUME_NONNULL_END
