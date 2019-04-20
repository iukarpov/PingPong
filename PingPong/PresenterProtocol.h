//
//  PresenterProtocol.m
//  PingPong
//
//  Created by Igor on 17/04/2019.
//  Copyright © 2019 Igor. All rights reserved.
//


#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


@protocol PresenterProtocol <NSObject>

- (void)performGameUI;
- (void)startGame;
- (void)resetGame;
- (void)resetBall;
- (void)startGameTimer;
- (void)selectComplexity:(CGFloat)value;

@end
