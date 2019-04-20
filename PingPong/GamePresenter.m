//
//  GamePresenter.m
//  PingPong
//
//  Created by Igor on 17/04/2019.
//  Copyright © 2019 Igor. All rights reserved.
//


#import "GamePresenter.h"


@implementation GamePresenter 


- (instancetype)initGameWith:(GameStartViewController *)gameView model:(Game *)model
{
    self = [super init];
    if (self)
    {
        _gameView = gameView;
        _gameModel = model;
    }
    return self;
}

- (void)performGameUI
{
    [self.gameView prepareGameUI];
}
- (void)resetGame
{
    [self.timer invalidate];
    [self.gameView resetPlatformsAndBallInitialPositions];
    self.gameModel.ballOffsetX *= -1;
    self.gameModel.ballOffsetY *= -1;
}

- (void)selectComplexity:(CGFloat)value
{

}

- (void)startGame
{
//    self.gameModel.ballOffsetY = 10.0;
//    self.gameModel.ballOffsetX = 10.0;
//    self.gameModel.ballVelocity = 0.1;
    [self startGameTimer];
}

- (void)resetBall
{
    [self.timer invalidate];
    [self.gameView placeBallInCenter];
    self.gameModel.ballOffsetX *= -1;
    self.gameModel.ballOffsetY *= -1;
    [self startGameTimer];
}

- (void)startGameTimer
{
    if ([self.timer isValid])
    {
        [self.timer invalidate];
        self.timer = nil;
    }
    else
    {
        self.timer = [NSTimer scheduledTimerWithTimeInterval:self.gameModel.ballVelocity target:self selector:@selector(moveBall) userInfo:nil repeats:YES];
    }
}
- (void)moveBall
{
    if ([self.gameView ballIntersectVerticalLeftViewBounds])
    {
        self.gameModel.ballOffsetX *= -1;
    }
    if ([self.gameView ballIntersectVerticalRightViewBounds])
    {
        self.gameModel.ballOffsetX *= -1;
    }
    if ([self.gameView ballIntersectBottomViewBound])
    {
        [self.gameView incrementGamerScore];
        [self resetBall];
    }
    if ([self.gameView ballIntersectEnemyPlatform])
    {
        self.gameModel.ballOffsetY *= -1;
    }
    if ([self.gameView ballIntersectGamerPlatform])
    {
        self.gameModel.ballOffsetY *= -1;
    }
    [self.gameView changeBallAnimationPosition:self.gameModel.ballOffsetX ballOffsetY:self.gameModel.ballOffsetY];
}

- (void)passSliderValueFromSettings:(CGFloat)value
{
   // self.gameModel.sliderValue = value;
    [self.gameModel selectComplexity:value];
}


@end
