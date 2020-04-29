//
//  MSRecordShareItemView.h
//  
//
//  Created by JZJ on 16/2/14.
//  Copyright © 2016年 JZJ. All rights reserved.
//

#import "MSShareItem.h"
#import <UIKit/UIKit.h>

@protocol MSRecordShareItemViewDataSource;

@interface MSRecordShareItemView : UIView<UICollectionViewDelegate,
                                         UICollectionViewDataSource>

@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) UIPageControl    *pageControl;
@property (nonatomic, weak)   id<MSRecordShareItemViewDataSource> dataSource;

- (instancetype)initWithFrame:(CGRect)frame dataSource:(id<MSRecordShareItemViewDataSource>)dataSource;

@end


@protocol MSRecordShareItemViewDataSource <NSObject>

- (NSArray<MSShareItem *> *)iteMSist;
- (void)didSelectShareItem:(MSShareItem *)shareItem;
- (void)didSelectSaveButton;

@end
