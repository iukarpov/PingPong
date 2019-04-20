//
//  Game.m
//  PingPong
//
//  Created by Igor on 17/04/2019.
//  Copyright © 2019 Igor. All rights reserved.
//


#import "Game.h"


@implementation Game

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.ballOffsetY = 10.0;
        self.ballOffsetX = 10.0;
        self.ballVelocity = 0.1;
    }
    return self;
}

- (void)selectComplexity:(CGFloat)valueFromSlider
{
    if (valueFromSlider == 1.0)
    {
        self.ballVelocity = 0.1;
        NSLog(@"%f",valueFromSlider);
        NSLog(@"%f",self.ballVelocity);
    }
    
    if (valueFromSlider == 2.0)
    {
        self.ballVelocity = 0.01;
        NSLog(@"%f",valueFromSlider);
        NSLog(@"%f",self.ballVelocity);
    }
    if (valueFromSlider == 3.0)
    {
        self.ballVelocity = 0.001;
        NSLog(@"%f",valueFromSlider);
        NSLog(@"%f",self.ballVelocity);
    }
}

@end

