//
//  MSRecardShareViewAnimator.h
//  
//
//  Created by JZJ on 16/12/6.
//  Copyright © 2016年 JZJ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MSRecardShareViewAnimator : NSObject <UIViewControllerAnimatedTransitioning>

@property (nonatomic, assign, getter=isPresenting) BOOL presenting;

@end
