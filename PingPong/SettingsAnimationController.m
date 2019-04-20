//
//  AnimationController.m
//  PingPong
//
//  Created by Igor on 07/04/2019.
//  Copyright © 2019 Igor. All rights reserved.
//


#import "SettingsAnimationController.h"


@implementation SettingsAnimationController

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext
{
    return 1.0;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext
{
    UIViewController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIView *fromView = fromVC.view;
    UIView *toView = toVC.view;
    UIView *containerView = [transitionContext containerView];
    NSTimeInterval duration = [self transitionDuration:transitionContext];
    CGRect initialFrame = [transitionContext initialFrameForViewController:fromVC];
    CGRect offscreenRect = CGRectOffset(initialFrame, 0, -[UIScreen mainScreen].bounds.size.height);
    
    if (self.appearing)
    {
        toView.frame = offscreenRect;
        [containerView addSubview:toView];
        [UIView animateWithDuration:duration delay:0 usingSpringWithDamping:0.5 initialSpringVelocity:1 options:0 animations: ^{
            toView.frame = initialFrame;
        } completion: ^(BOOL finished) {
            [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
        }];
    }
    else
    {
        [containerView addSubview:toView];
        [containerView sendSubviewToBack:toView];
        [UIView animateWithDuration:duration delay:0 usingSpringWithDamping:0.5 initialSpringVelocity:1 options:0 animations: ^{
            fromView.frame = offscreenRect;
        } completion: ^(BOOL finished) {
            [fromView removeFromSuperview];
            [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
            
        }];
    }
}
@end
