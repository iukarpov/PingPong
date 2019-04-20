//
//  Game.h
//  PingPong
//
//  Created by Igor on 17/04/2019.
//  Copyright © 2019 Igor. All rights reserved.
//


#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>


NS_ASSUME_NONNULL_BEGIN


@interface Game : NSObject

@property (nonatomic, assign) NSInteger enemyScore;
@property (nonatomic, assign) NSInteger gamerScore;
@property (nonatomic, assign) CGFloat ballVelocity;
@property (nonatomic, assign) CGFloat ballOffsetX;
@property (nonatomic, assign) CGFloat ballOffsetY;
@property (nonatomic, assign) CGFloat sliderValue;


- (void)selectComplexity:(CGFloat)valueFromSlider;
@end

NS_ASSUME_NONNULL_END
