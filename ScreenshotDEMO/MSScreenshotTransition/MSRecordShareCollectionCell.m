//
//  MSRecordShareCollectionCell.m
//  
//
//  Created by JZJ on 16/2/14.
//  Copyright © 2016年 JZJ. All rights reserved.
//

#import "MSRecordShareCollectionCell.h"

#if !__has_feature(objc_arc)
#error MSRecordShareCollectionCell must be built with ARC.
#endif

@implementation MSRecordShareCollectionCell

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        
        CGFloat width        = frame.size.width;
        self.imageView.frame = CGRectMake(0, 0, width, 44);
        self.lable.frame     = CGRectMake(0, 44, width, 15);
    }
    return self;
}



#pragma mark -- lazy
- (UIImageView *)imageView{
    if(!_imageView){
        _imageView = [UIImageView new];
        _imageView.contentMode = UIViewContentModeCenter;;
        [self.contentView addSubview:_imageView];
    }
    return _imageView;
}

-(UILabel *)lable{
    if(!_lable){
        _lable = [UILabel new];
        _lable.font = [UIFont systemFontOfSize:12];
        _lable.textAlignment = NSTextAlignmentCenter;
        _lable.textColor = [UIColor darkGrayColor];
        [self.contentView addSubview:_lable];
    }
    return _lable;
}

@end
