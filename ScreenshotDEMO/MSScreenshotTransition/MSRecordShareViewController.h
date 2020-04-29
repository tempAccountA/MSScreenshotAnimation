//
//  MSRecordShareViewController.h
//  
//
//  Created by JZJ on 2016/7/6.
//  Copyright © 2016年 JZJ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MSRecordShareViewController : UIViewController


@property (nonatomic, copy) void (^closeShareHandler)(void);
@property (nonatomic, copy) void (^saveHandler)(void);
@property (nonatomic, copy) void (^shareToMomoFeedHandler)(void);
@property (nonatomic, copy) void (^sendChatMessageHandler)(NSString *source, NSString *eid, BOOL catchAnimalSuccess);

@property (nonatomic, strong)    UIView   *containerView;
@property (nonatomic,   copy)    NSString *qid;

- (instancetype)initWithReocord;
- (void)setupWithScreenImage:(UIImage *)image;
//设置屏幕变小的动画设置内容
- (void)setupScaleSmall;
//关闭动画
- (void)setupCloseAnimation;
- (void)presentTransitionComplete;

@end
