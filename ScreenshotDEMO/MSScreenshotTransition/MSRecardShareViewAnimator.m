//
//  MSRecardShareViewAnimator.m
//  
//
//  Created by JZJ on 16/12/6.
//  Copyright © 2016年 JZJ. All rights reserved.
//

#import "MSRecardShareViewAnimator.h"
#import "MSRecordShareViewController.h"

#if !__has_feature(objc_arc)
#error MSRecardShareViewAnimator must be built with ARC.
#endif

static CGFloat const duration = 0.3;

@implementation MSRecardShareViewAnimator

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext {
    return duration;
}

//UIViewControllerContextTransitioning 提供转场动画上下文信息
//A set of methods that provide contextual information for transition animations between view controllers.
//非交互式动画
- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
    UIView *containerView = [transitionContext containerView];
    UIViewController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIView *toView = toVC.view;
    if (self.isPresenting) {//出现的时候取 UITransitionContextToViewControllerKey 前往哪个VC
        MSRecordShareViewController *recordVC = (MSRecordShareViewController *)toVC;
        [containerView addSubview:toView];
            [UIView animateWithDuration:[self transitionDuration:transitionContext]
                             animations:^{
                                 [recordVC setupScaleSmall];//从屏幕大小变成0.8 scale
                             } completion:^(BOOL finished) {
                                 [recordVC presentTransitionComplete];
                                 [transitionContext completeTransition:finished];
                             }];
    } else {//消失的时候取 UITransitionContextFromViewControllerKey 从哪里消失
        MSRecordShareViewController *recordVC = (MSRecordShareViewController *)fromVC;

            [UIView animateWithDuration:[self transitionDuration:transitionContext]
                             animations:^{
                                 [recordVC setupCloseAnimation];
                             } completion:^(BOOL finished) {
                                 [transitionContext completeTransition:finished];
                             }];
    }
}

@end
