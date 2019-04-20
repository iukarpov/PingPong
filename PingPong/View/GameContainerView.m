//
//  GameContainerView.m
//  PingPong
//
//  Created by Igor on 12/04/2019.
//  Copyright © 2019 Igor. All rights reserved.
//


#import "GameContainerView.h"


@implementation GameContainerView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        [self createContainerView];
    }
    return self;
}

- (NSArray *)createContainerView
{

    self.gameContainerViewArray = @[[self setupBallView], [self setupGamerPlatformView], [self setupEnemyPlatformView], [self setupGamerScoreLabel], [self setupEnemyScoreLabel], [self setupStartButton], [self setupStopButton] , [self setupSettingsButton]];

    return self.gameContainerViewArray;
}

- (UIButton *)setupStartButton
{
    CGFloat startButtonX = CGRectGetMinX(self.frame) + 15;
    CGFloat startButtonY = CGRectGetMinY(self.gamerPlatformView.frame) + CGRectGetHeight(self.gamerPlatformView.frame) + 10;
    CGFloat startButtonWidth = CGRectGetWidth(self.frame)/3 - 20;
    CGFloat startButtonHeight = CGRectGetHeight(self.frame) - CGRectGetMinY(self.gamerPlatformView.frame) - CGRectGetHeight(self.gamerPlatformView.frame) - 20;
    
    self.startButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.startButton setTitle:@"Start/Pause" forState:UIControlStateNormal];
    self.startButton.frame = CGRectMake(startButtonX, startButtonY, startButtonWidth, startButtonHeight);
    self.startButton.layer.cornerRadius = 15;
    self.startButton.backgroundColor = [UIColor colorWithRed:128/255.0 green:0/255.0 blue:255/255.0 alpha:1.0];
    self.startButton.layer.shadowOffset = CGSizeMake(15.0, 15.0);
    self.startButton.layer.borderColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:1.0].CGColor;
    self.startButton.layer.shadowColor = [UIColor lightGrayColor].CGColor;
    self.startButton.layer.shadowOffset = CGSizeMake(0,2);
    self.startButton.layer.shadowOpacity = 0.9;
    self.startButton.layer.borderWidth = 2;
    [self addSubview:self.startButton];
    
    return self.startButton;
}

- (UIButton *)setupSettingsButton
{
    CGFloat settingsButtonX = CGRectGetWidth(self.startButton.frame) + 30;
    CGFloat settingsButtonY = CGRectGetMinY(self.gamerPlatformView.frame) + CGRectGetHeight(self.gamerPlatformView.frame) + 10;
    CGFloat settingsButtonWidth = CGRectGetWidth(self.frame)/3 - 20;
    CGFloat settingsButtonHeight = CGRectGetHeight(self.frame) - CGRectGetMinY(self.gamerPlatformView.frame) - CGRectGetHeight(self.gamerPlatformView.frame)  - 20;
    
    self.settingsButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.settingsButton setTitle:@"Settings" forState:UIControlStateNormal];
    self.settingsButton.frame = CGRectMake(settingsButtonX, settingsButtonY, settingsButtonWidth, settingsButtonHeight);
    self.settingsButton.layer.shadowOffset = CGSizeMake(15.0, 15.0);
    self.settingsButton.layer.borderColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:1.0].CGColor;
    self.settingsButton.layer.shadowColor = [UIColor lightGrayColor].CGColor;
    self.settingsButton.layer.shadowOffset = CGSizeMake(0,2);
    self.settingsButton.layer.shadowOpacity = 0.9;
    self.settingsButton.layer.borderWidth = 2;
    self.settingsButton.backgroundColor = [UIColor colorWithRed:128/255.0 green:0/255.0 blue:255/255.0 alpha:1.0];
    self.settingsButton.layer.cornerRadius = 15;
    [self addSubview:self.settingsButton];
    
    return self.settingsButton;
}

- (UIButton *)setupStopButton
{
    CGFloat stopButtonX = CGRectGetWidth(self.frame) - CGRectGetWidth(self.startButton.frame) - 15;
    CGFloat stopButtonY = CGRectGetMinY(self.gamerPlatformView.frame) + CGRectGetHeight(self.gamerPlatformView.frame) + 10;
    CGFloat stopButtonWidth = CGRectGetWidth(self.frame)/3 - 20;
    CGFloat stopButtonHeight = CGRectGetHeight(self.frame) - CGRectGetMinY(self.gamerPlatformView.frame) - CGRectGetHeight(self.gamerPlatformView.frame) - 20;
    self.stopButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.stopButton setTitle:@"Stop" forState:UIControlStateNormal];
    self.stopButton.frame = CGRectMake(stopButtonX, stopButtonY, stopButtonWidth, stopButtonHeight);
    self.stopButton.backgroundColor = [UIColor colorWithRed:128/255.0 green:0/255.0 blue:255/255.0 alpha:1.0];
    self.stopButton.layer.cornerRadius = 15;
    self.stopButton.layer.shadowOffset = CGSizeMake(15.0, 15.0);
    self.stopButton.layer.borderColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:1.0].CGColor;
    self.stopButton.layer.shadowColor = [UIColor lightGrayColor].CGColor;
    self.stopButton.layer.shadowOffset = CGSizeMake(0,2);
    self.stopButton.layer.shadowOpacity = 0.9;
    self.stopButton.layer.borderWidth = 2;
    [self addSubview:self.stopButton];
    
    return self.stopButton;
}

- (UIView *)setupBallView
{
    CGFloat ballViewWidth = 20.0;
    CGFloat ballViewHeight = 20.0;
    CGFloat ballViewX = CGRectGetMidX(self.frame) - ballViewWidth/2;
    CGFloat ballViewY = CGRectGetMidY(self.frame) - ballViewHeight/2;
    
    self.ball = [[UIView alloc]initWithFrame:CGRectMake(ballViewX,ballViewY, ballViewWidth, ballViewHeight)];
    self.ball.layer.cornerRadius = ballViewWidth/2;
    self.ball.backgroundColor = UIColor.whiteColor;
    [self addSubview:self.ball];
    return self.ball;
}

- (UIView *)setupGamerPlatformView
{
    CGFloat platformViewWidth = 120.0;
    CGFloat platformViewHeight = 20.0;
    CGFloat platformViewX = CGRectGetMidX(self.frame) - platformViewWidth/2;
    CGFloat platformViewY = CGRectGetMaxY(self.frame) - 90.0;
    
    self.gamerPlatformView = [[UIView alloc] initWithFrame:CGRectMake(platformViewX, platformViewY, platformViewWidth, platformViewHeight)];
    self.gamerPlatformView.backgroundColor = [UIColor whiteColor];
    [self addSubview:self.gamerPlatformView];
    return self.gamerPlatformView;
}

- (UIView *)setupEnemyPlatformView
{
    CGFloat platformViewWidth = 120.0;
    CGFloat platformViewHeight = 20.0;
    CGFloat platformViewX = CGRectGetMidX(self.frame) - platformViewWidth/2;
    CGFloat platformViewY = CGRectGetMinY(self.frame) + 30.0;
    
    self.enemyPlatformView = [[UIView alloc] initWithFrame:CGRectMake(platformViewX, platformViewY, platformViewWidth, platformViewHeight)];
    self.enemyPlatformView.backgroundColor = [UIColor whiteColor];
    [self addSubview:self.enemyPlatformView];
    return self.enemyPlatformView;
}

- (UILabel *)setupGamerScoreLabel
{
    CGFloat gamerScoreLabelWidth = 50.0;
    CGFloat gamerScoreLabelHeight = 70.0;
    CGFloat gamerScoreLabelX = CGRectGetMidX(self.frame) - gamerScoreLabelWidth/2;
    CGFloat gamerScoreLabelY = CGRectGetMidY(self.frame) + 50.0;
    
    self.gamerScoreLabel = [[UILabel alloc] initWithFrame:CGRectMake(gamerScoreLabelX, gamerScoreLabelY, gamerScoreLabelWidth, gamerScoreLabelHeight)];
    self.gamerScoreLabel.textColor = UIColor.whiteColor;
    [self.gamerScoreLabel setFont:[UIFont systemFontOfSize:40]];
    [self.gamerScoreLabel setTextAlignment: NSTextAlignmentCenter];
    [self addSubview:self.gamerScoreLabel];
    return self.gamerScoreLabel;
}

- (UILabel *)setupEnemyScoreLabel
{
    CGFloat enemyScoreLabelWidth = 50.0;
    CGFloat enemyScoreLabelHeight = 70.0;
    CGFloat enemyScoreLabelX = CGRectGetMidX(self.frame) - enemyScoreLabelWidth/2;
    CGFloat enemyScoreLabelY = CGRectGetMidY(self.frame) - 120.0;
    
    self.enemyScoreLabel = [[UILabel alloc] initWithFrame:CGRectMake(enemyScoreLabelX, enemyScoreLabelY, enemyScoreLabelWidth, enemyScoreLabelHeight)];
    self.enemyScoreLabel.textColor = UIColor.whiteColor;
    [self.enemyScoreLabel setFont:[UIFont systemFontOfSize:40]];
    [self.enemyScoreLabel setTextAlignment: NSTextAlignmentCenter];
    self.enemyScoreLabel.text = @"0";
    [self addSubview:self.enemyScoreLabel];
    return self.enemyScoreLabel;
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = touches.anyObject;
    CGPoint touchLocation = [touch locationInView:self];
    CGPoint newPlatformLocation = self.gamerPlatformView.center;
    if ([touch view] == self.gamerPlatformView)
    {
        newPlatformLocation.x = touchLocation.x;
        self.gamerPlatformView.center = newPlatformLocation;
    }
}
@end
