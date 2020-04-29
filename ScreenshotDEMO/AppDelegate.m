//
//  AppDelegate.m
//  ScreenshotDEMO
//
//  Created by JZJ on 2016/7/7.
//  Copyright © 2016年 JZJ. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    self.window.rootViewController = ViewController.new;
    [self.window makeKeyAndVisible];
    return YES;
}
@end
