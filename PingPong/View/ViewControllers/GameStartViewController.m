//
//  ViewController.m
//  PingPong
//
//  Created by Igor on 04/04/2019.
//  Copyright © 2019 Igor. All rights reserved.
//


#import "GameStartViewController.h"




@interface GameStartViewController () <UIViewControllerTransitioningDelegate>

@property (nonatomic, strong) GameContainerView *gameContainer;
@property (nonatomic, assign) NSInteger gamerScore;
@property (nonatomic, assign) NSInteger enemyScore;
@property (nonatomic, strong) SettingsAnimationController *transitionManager;

@end


@implementation GameStartViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.presenter performGameUI];
    self.gamerScore = 0.0;
    self.enemyScore = 0.0;
}

- (void)prepareGameUI
{
    self.transitionManager = [[SettingsAnimationController alloc]init];
    self.gameContainer = [[GameContainerView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    [self.view addSubview:self.gameContainer];
    self.gameContainer.gamerScoreLabel.text = @"0";
    self.gameContainer.enemyScoreLabel.text = @"0";
    [self.gameContainer.startButton addTarget:self action:@selector(beginGame) forControlEvents:UIControlEventTouchUpInside];
    [self.gameContainer.settingsButton addTarget:self action:@selector(performSettings) forControlEvents:UIControlEventTouchUpInside];
    [self.gameContainer.stopButton addTarget:self action:@selector(stopGame) forControlEvents:UIControlEventTouchUpInside];
}

- (void)beginGame
{
    [self.presenter startGame];
}
- (void)stopGame
{
    [self.presenter resetGame];
    self.gamerScore = 0;
    self.gameContainer.gamerScoreLabel.text = @"0";
}

- (void)placeBallInCenter
{
    self.gameContainer.ball.center = self.gameContainer.center;
}

- (void)resetPlatformsAndBallInitialPositions
{
    CGFloat gameContainerCenterX = self.gameContainer.center.x;
    CGPoint enemyPlatformCenter = self.gameContainer.enemyPlatformView.center;
    CGPoint gamerPlatformCenter = self.gameContainer.gamerPlatformView.center;
    self.gameContainer.ball.center = self.gameContainer.center;
    enemyPlatformCenter.x = gameContainerCenterX;
    self.gameContainer.enemyPlatformView.center = enemyPlatformCenter;
    gamerPlatformCenter.x = gameContainerCenterX;
    self.gameContainer.gamerPlatformView.center = gamerPlatformCenter;
}

- (void)incrementGamerScore
{
    self.gamerScore++;
    NSString *score = [NSString stringWithFormat: @"%ld", (long)self.gamerScore];
    self.gameContainer.gamerScoreLabel.text = score;
}

- (BOOL)ballIntersectVerticalLeftViewBounds
{
    if (self.gameContainer.ball.center.x < self.gameContainer.ball.frame.size.width)
    {
        return YES;
    }
    return NO;
}

- (BOOL)ballIntersectVerticalRightViewBounds
{
    if (self.gameContainer.ball.center.x > self.gameContainer.bounds.size.width - self.gameContainer.ball.frame.size.width)
    {
        return YES;
    }
    return NO;
}

- (BOOL)ballIntersectGamerPlatform
{
    if (CGRectIntersectsRect(self.gameContainer.ball.frame, self.gameContainer.gamerPlatformView.frame))
    {
        return YES;
    }
    return NO;
}

- (BOOL)ballIntersectEnemyPlatform
{
    if (CGRectIntersectsRect(self.gameContainer.ball.frame, self.gameContainer.enemyPlatformView.frame))
    {
        return YES;
    }
    return NO;
}

- (BOOL)ballIntersectBottomViewBound
{
    if (self.gameContainer.ball.frame.origin.y + self.gameContainer.ball.frame.size.height > self.gameContainer.gamerPlatformView.frame.origin.y + CGRectGetHeight(self.gameContainer.gamerPlatformView.frame))
    {
        return YES;
    }
    return NO;
}

- (void)changeBallAnimationPosition:(CGFloat)ballOffsetX ballOffsetY:(CGFloat)ballOffsetY
{
    CGPoint enemyPlatformCenter = self.gameContainer.enemyPlatformView.center;
    enemyPlatformCenter.x = self.gameContainer.ball.center.x;
    self.gameContainer.enemyPlatformView.center = enemyPlatformCenter;
    self.gameContainer.ball.center = CGPointMake(self.gameContainer.ball.center.x + ballOffsetX, self.gameContainer.ball.center.y + ballOffsetY);
}

- (void)performSettings
{
    SettingsViewController *settingsViewController = [SettingsViewController new];
    settingsViewController.transitioningDelegate = self;
    settingsViewController.complexityDelegate = self.presenter;
    [self presentViewController:settingsViewController animated:YES completion:nil];
    [self stopGame];
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source
{
    SettingsAnimationController *animator = [SettingsAnimationController new];
    animator.appearing = YES;
    return animator;
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed
{
    SettingsAnimationController *animator = [SettingsAnimationController new];
    animator.appearing = NO;
    return animator;
}
@end




