//
//  MSRecordShareViewController.m
//  
//
//  Created by JZJ on 2016/7/6.
//  Copyright © 2016年 JZJ. All rights reserved.
//





#import "MSRecordShareViewController.h"
#import "MSRecardShareViewAnimator.h"
#import "MSShareItem.h"
#import "MSRecordShareItemView.h"
#import "MSSNSShareCommon.h"

static CGFloat const kScreenShotScale = 0.85;
static CGFloat const kShareButtonHeight = 105;

@interface MSRecordShareViewController ()<UIViewControllerTransitioningDelegate,
                                          MSRecordShareItemViewDataSource>

@property (nonatomic, strong) UIImage     *screenImage;
@property (nonatomic, strong) UIImageView *screenImageView;
@property (nonatomic, strong) UIView      *bottomView;
@property (nonatomic, strong) UIButton    *closeButton;
@property (nonatomic, strong) UIView      *shareItemView;
@property (nonatomic, strong) NSArray     *configureShareItems;
@property (nonatomic, strong) NSURL       *videoURL;
@end

@implementation MSRecordShareViewController

- (void)viewDidLoad {
    [super viewDidLoad];
        self.view.backgroundColor = [UIColor clearColor];
    
        [self.view addSubview:self.containerView];
        [self.containerView addSubview:self.screenImageView];
        [self.containerView addSubview:self.bottomView];
        [self.bottomView    addSubview:self.shareItemView];
}

- (instancetype)initWithReocord{
    self.modalPresentationStyle = UIModalPresentationCustom;
    self.transitioningDelegate = self;
    return self;
}


- (void)setupWithScreenImage:(UIImage *)image{
    _screenImage = image;
    self.screenImageView.image = image;//截屏图片
}

- (void)presentTransitionComplete{
    self.closeButton.hidden = NO;
}

- (void)setupScaleSmall{//present出现
    _containerView.layer.borderWidth = 4;
    _containerView.layer.cornerRadius = 8;
    _screenImageView.layer.cornerRadius = 6;
    _bottomView.alpha = 1.0;
    _containerView.transform = CGAffineTransformMakeScale(kScreenShotScale, kScreenShotScale);//scale宽高 0.8
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations{
    return UIInterfaceOrientationMaskPortrait;
}



- (void)didClickCloseButton:(id)sender{//dismiss
    [self dismissViewControllerAnimated:YES completion:^{
        if (_closeShareHandler) {
            _closeShareHandler();
        }
    }];
}

- (void)didSelectSaveButton{//点击存入相册0 cell

    if (_saveHandler) {
        _saveHandler();
    }
}




- (void)setupCloseAnimation{//透明 并且向下移动20
    self.view.alpha = 0.;
    CGPoint center = CGPointMake(self.containerView.center.x, self.containerView.center.y+20);
    self.containerView.center = center;
    
    center = CGPointMake(self.closeButton.center.x, self.closeButton.center.y+20);
    self.closeButton.center = center;
}


#pragma mark - UIViewControllerTransitioningDelegate  转场动画
- (id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source {
    MSRecardShareViewAnimator *animator = [[MSRecardShareViewAnimator alloc] init];
    animator.presenting = YES;
    return animator;
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed {
    MSRecardShareViewAnimator *animator = [[MSRecardShareViewAnimator alloc] init];
    animator.presenting = NO;
    return animator;
}



#pragma mark - MSRecordShareItemViewDataSource

- (NSArray*)iteMSist{
    if (_configureShareItems) {
        return _configureShareItems;
    }
    MSShareItem *item0 = [[MSShareItem alloc] init];
    item0.title = kMoment;
    item0.iconName = kMomentShareImage;
    item0.platform = MSSNSPlatformWeixFriends;
    
    MSShareItem *item1 = [[MSShareItem alloc] init];
    item1.title = kWechatFriend;
    item1.iconName = kWechatFriendShareImage;
    item1.platform = MSSNSPlatformWeixin;
    
    MSShareItem *item2 = [[MSShareItem alloc] init];
    item2.title = kWeibo;
    item2.iconName = kWeiboShareImage;
    item2.platform = MSSNSPlatformSina;
    
    MSShareItem *item3 = [[MSShareItem alloc] init];
    item3.title = kQQZone;
    item3.iconName = kQQZoneShareImage;
    item3.platform = MSSNSPlatformQQZone;
    
    MSShareItem *item4 = [[MSShareItem alloc] init];
    item4.title = kQQFriend;
    item4.iconName = kkQQFriendShareImage;
    item4.platform = MSSNSPlatformQQ;
    
    MSShareItem *item5 = [[MSShareItem alloc] init];
    item5.title = kPersonalState;
    item5.iconName = kkPersonalStateShareImage;
    item5.platform = MSSNSPlatformMomoFeed;
    _configureShareItems = @[item0, item1, item2, item3, item4, item5];
    
    return _configureShareItems;
}

- (void)didSelectShareItem:(MSShareItem *)shareItem{

}


- (void)actionShare{
    
}


#pragma mark - lazy
- (UIView *)containerView{
    if(!_containerView){
        _containerView = [[UIView alloc] initWithFrame:self.view.bounds];
        _containerView.layer.masksToBounds = YES;
        _containerView.layer.borderColor = [UIColor whiteColor].CGColor;
        [self.view addSubview:_containerView];
        
        UIView *maskView = [[UIView alloc] initWithFrame:self.view.bounds];
        maskView.backgroundColor = [UIColor clearColor];
        maskView.alpha = 0.2;
        [self.view addSubview:maskView];
    }
    return _containerView;
}


- (UIView *)bottomView{
    if(!_bottomView){
        _bottomView = [[UIView alloc] initWithFrame:CGRectMake(0, self.view.bounds.size.height - kShareButtonHeight / kScreenShotScale, self.view.bounds.size.width, kShareButtonHeight / kScreenShotScale)];
        _bottomView.alpha = 0.;
        _bottomView.backgroundColor = [UIColor whiteColor];
        [self.containerView addSubview:_bottomView];
    }
    return _bottomView;
}



- (UIButton *)closeButton{
    if(!_closeButton){
        _closeButton = [UIButton buttonWithType:UIButtonTypeCustom];
        UIImage *image = [UIImage imageNamed:khareClose];
        [_closeButton setImage:image forState:UIControlStateNormal];
        [self.containerView addSubview:_closeButton];
        _closeButton.hidden = YES;
        _closeButton.frame = CGRectMake(self.view.bounds.size.width-44, 0, 44, 44);
        [_closeButton addTarget:self action:@selector(didClickCloseButton:) forControlEvents:UIControlEventTouchDown];    }
    return _closeButton;
}



-(UIView *)shareItemView{
    if(!_shareItemView){
        _shareItemView = [[MSRecordShareItemView alloc] initWithFrame:CGRectMake(0, 12 / kScreenShotScale, self.bottomView.frame.size.width, self.bottomView.frame.size.height - 12 / kScreenShotScale)
                                                           dataSource:self];
        _shareItemView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        [self.bottomView addSubview:_shareItemView];
    }
    return _shareItemView;
}



-(UIImageView *)screenImageView{
    if(!_screenImageView){
        _screenImageView = [[UIImageView alloc] initWithFrame:self.view.bounds];
        _screenImageView.contentMode = UIViewContentModeScaleToFill;
        _screenImageView.layer.cornerRadius = 8;
        _screenImageView.layer.masksToBounds = YES;
        _screenImageView.userInteractionEnabled = YES;
        [self.containerView addSubview:_screenImageView];
    }
    return _screenImageView;
}
@end
