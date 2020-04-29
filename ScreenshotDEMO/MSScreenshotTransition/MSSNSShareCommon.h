//
//  MSSNSShareCommen.h
//
//
//  Created by JZJ on 13-11-27.
//  Copyright (c) 2013年 JZJ. All rights reserved.
//

typedef enum {
    MSSNSPlatformBegin,
    MSSNSPlatformMomoFeed = MSSNSPlatformBegin,
    MSSNSPlatformMomoRecommend,
    MSSNSPlatformWeixin,
    MSSNSPlatformSina,
    MSSNSPlatformWeixFriends,//微信朋友圈
    MSSNSPlatformQQ,
    MSSNSPlatformMomoFriend,
    MSSNSPlatformMomoGroup,
    MSSNSPlatformMomoDiscuss,
    MSSNSPlatformMomo,//包括群组和好友
    MSSNSPlatformSafari,
    MSSNSPlatformQQZone,
    MSSNSPlatformFriendDynamic,
    MSSNSPlatforMSiveFeed,
    MSSNSPlatformAll,
    MSSNSPlatformUndefined,
    MSSNSPlatformAli,
    MSSNSPlatformMomoMoment,//时刻
    MSSNSPlatformMomoFansCircle,//粉丝圈
    MSSNSPlatformReport,
    MSSNSPlatformNoInteresting, // 不感兴趣
    MSSNSPlatformClearVisiting  // 清除访问
    
} MSSNSPlatform;

#define kSNSSharePlatform @"kSNSSharePlatform"
#define kSNSShareIconView @"kSNSShareIconView"

#define TEXT_WEIBO_TITLE          LocalizedStringWithKey(@"绑定新浪微博")
#define TEXT_WEIBO_TEXT           LocalizedStringWithKey(@"绑定新浪微博提示")
#define TEXT_RENREN_TEXT          LocalizedStringWithKey(@"人人绑定提示")
#define TEXT_RENREN_TITLE         LocalizedStringWithKey(@"即将绑定人人帐号")

#define kSyncsinaKey              @"sync_sina"
#define kSyncrenrenKey            @"sync_renren"
#define kSynctencentKey           @"sync_qqwb"
#define kSyncfeedKey              @"sync_feed"
#define kSyncWeixinKey            @"sync_weixin"
#define kSyncWeixinFriendKey      @"sync_weixin_friend"
#define kSyncQQKey                @"sync_qq"
#define kSyncQQZoneKey            @"sync_qzone"
#define kSyncFriendFeedKey        @"sync_friend_feed"
#define kSyncLiveFeedKey          @"sync_live_feed"

#define BUTTON_TITILE_COLOR       RGBCOLOR(140, 140, 140)
#define BUTTON_FONT               [UIFont systemFontOfSize:14];


//视频使用
#define MSScreenWidth             CGRectGetWidth([[UIScreen mainScreen] bounds])
#define MSScreenHeight            CGRectGetHeight([[[UIApplication sharedApplication].delegate window] bounds])


#define RGBCOLOR(r,g,b)            [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1]
#define RGBACOLOR(r,g,b,a)         [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:(a)]

static NSString* const khareClose = @"ms_record_share_close";
static NSString* const kSave = @"保存";
static NSString* const kSaveImage = @"ms_record_save";
static NSString* const kWeibo = @"微博";
static NSString* const kWeiboShareImage = @"ms_share_weibo";
static NSString* const kMoment = @"朋友圈";
static NSString* const kMomentShareImage = @"ms_share_weixin_time_line";
static NSString* const kWechatFriend = @"微信好友";
static NSString* const kWechatFriendShareImage = @"ms_share_weixin_friend";
static NSString* const kQQZone = @"QQ空间";
static NSString* const kQQZoneShareImage = @"ms_share_qzone";
static NSString* const kQQFriend = @"QQ好友";
static NSString* const kkQQFriendShareImage = @"ms_share_qq_friend";
static NSString* const kPersonalState = @"个人动态";
static NSString* const kkPersonalStateShareImage = @"ms_share_momo_feed";


