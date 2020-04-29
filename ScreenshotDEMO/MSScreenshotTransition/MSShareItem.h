//
//  MSShareItem.h
//
//
//  Created by JZJ on 16/2/14.
//  Copyright © 2016年 JZJ. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MSSNSShareCommon.h"

@interface MSShareItem : NSObject

@property (nonatomic, copy)   NSString      *title;
@property (nonatomic, copy)   NSString      *iconName;
@property (nonatomic, assign) MSSNSPlatform  platform;

@end
