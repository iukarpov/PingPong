//
//  AnimationController.h
//  PingPong
//
//  Created by Igor on 07/04/2019.
//  Copyright © 2019 Igor. All rights reserved.
//


#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


NS_ASSUME_NONNULL_BEGIN


@interface SettingsAnimationController : NSObject <UIViewControllerAnimatedTransitioning>

@property (nonatomic, assign, getter= isAppearing) BOOL appearing;

@end

NS_ASSUME_NONNULL_END
