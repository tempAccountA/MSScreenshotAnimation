//
//  ViewController.m
//  ScreenshotDEMO
//
//  Created by JZJ on 2016/7/7.
//  Copyright © 2016年 JZJ. All rights reserved.
//

#import "ViewController.h"
#import "MSRecordShareViewController.h"

@interface ViewController ()
@property (nonatomic,strong) MSRecordShareViewController *shareVC;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

   UIImageView* imgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"image"]];
    imgView.frame = self.view.bounds;
    [self.view addSubview:imgView];
    
    //截屏通知
    [[NSNotificationCenter defaultCenter] addObserverForName:UIApplicationUserDidTakeScreenshotNotification object:nil queue:nil usingBlock:^(NSNotification * _Nonnull note) {
        
        [self screenSnapshot:nil];
    }];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self screenSnapshot:nil];
}

- (IBAction)shot:(UIButton *)sender {
    [self screenSnapshot:sender];
}


//触发转场动画
- (void)screenSnapshot:(UIView *)excludeView {
    if(self.presentedViewController)return;
    
    UIWindow *screenWindow = [[UIApplication sharedApplication] keyWindow];
    UIGraphicsBeginImageContextWithOptions(screenWindow.frame.size, NO, 0.0);
    [self drawCurrentScreenInBitmapContext:UIGraphicsGetCurrentContext() exclusive:excludeView];
    UIImage *screenImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    [self present];
    [self.shareVC setupWithScreenImage:screenImage];
}

- (void)present{
    
    self.shareVC = [[MSRecordShareViewController alloc] initWithReocord];
    [self presentViewController:self.shareVC animated:YES completion:NULL];
}


- (void)drawCurrentScreenInBitmapContext:(CGContextRef)bitmapContext exclusive:(UIView *)excludeView {
    
    excludeView.hidden = YES;//隐藏当前控件
    [[UIApplication sharedApplication].keyWindow drawViewHierarchyInRect:
     [UIApplication sharedApplication].keyWindow.bounds afterScreenUpdates:YES];
    
    excludeView.hidden = NO;//截图后显示
}

@end
