//
//  GameProtocols.h
//  PingPong
//
//  Created by Igor on 17/04/2019.
//  Copyright © 2019 Igor. All rights reserved.
//


#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


@protocol GameProtocol <NSObject>

- (void)prepareGameUI;
- (void)performSettings;
- (void)resetPlatformsAndBallInitialPositions;
- (void)placeBallInCenter;
- (void)incrementGamerScore;
- (BOOL)ballIntersectVerticalRightViewBounds;
- (BOOL)ballIntersectVerticalLeftViewBounds;
- (BOOL)ballIntersectGamerPlatform;
- (BOOL)ballIntersectEnemyPlatform;
- (BOOL)ballIntersectBottomViewBound;
- (void)changeBallAnimationPosition:(CGFloat)ballOffsetX ballOffsetY:(CGFloat)ballOffsetY;

@end


