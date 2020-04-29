//
//  MSRecordShareItemView.m
//  
//
//  Created by JZJ on 16/2/14.
//  Copyright © 2016年 JZJ. All rights reserved.
//

#import "MSRecordShareItemView.h"
#import "MSRecordShareCollectionCell.h"

#if !__has_feature(objc_arc)
#error MSRecordShareItemView must be built with ARC.
#endif

@implementation MSRecordShareItemView

- (instancetype)initWithFrame:(CGRect)frame dataSource:(id<MSRecordShareItemViewDataSource>)dataSource;
{
    if (self = [super initWithFrame:frame]) {
        self.dataSource = dataSource;
        
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        layout.minimumLineSpacing = 0;
        layout.minimumInteritemSpacing = 0;
        layout.itemSize = CGSizeMake(frame.size.width / 4.0 , frame.size.height);
        
        _collectionView = [[UICollectionView alloc] initWithFrame:self.bounds collectionViewLayout:layout];
        _collectionView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _collectionView.pagingEnabled = YES;
        _collectionView.backgroundColor = [UIColor clearColor];
        _collectionView.showsHorizontalScrollIndicator = NO;
        _collectionView.contentSize = CGSizeMake(_collectionView.bounds.size.width * ceilf(([dataSource iteMSist].count * 1.0) / 4), _collectionView.bounds.size.height);
        [self addSubview:_collectionView];
        
        self.pageControl.numberOfPages = ceilf(([dataSource iteMSist].count * 1.0) / 4);
        [self.collectionView registerClass:MSRecordShareCollectionCell.class forCellWithReuseIdentifier:MSRecordShareCollectionCell.class.description];
    }
    
    return self;
}

#pragma mark - uicollection view

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return [self.dataSource iteMSist].count + 1;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    MSRecordShareCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:[[MSRecordShareCollectionCell class] description] forIndexPath:indexPath];
    if (indexPath.row == 0) {
        cell.imageView.image = [UIImage imageNamed:kSaveImage];
        cell.lable.text = kSave;
    } else {
        MSShareItem *item = [[self.dataSource iteMSist] objectAtIndex:indexPath.row - 1];
        cell.imageView.image = [UIImage imageNamed:item.iconName];
        cell.lable.text = item.title;
    }
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        [self.dataSource didSelectSaveButton];
    } else {
        MSShareItem *item = [[self.dataSource iteMSist] objectAtIndex:indexPath.row - 1];
        [self.dataSource didSelectShareItem:item];
    }
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    //（x+0.5个屏幕宽度） ／ 屏幕宽度
    CGFloat pageWidth = MSScreenWidth;
    NSUInteger page = (NSUInteger) floor((scrollView.contentOffset.x + pageWidth*1.0*0.5)/pageWidth);
    self.pageControl.currentPage = page;
}


#pragma mark --lazy
- (UIPageControl *)pageControl{
    if(!_pageControl){
        _pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(0, self.bounds.size.height - 40, self.bounds.size.width, 30)];
        [self addSubview:_pageControl];
        _pageControl.hidesForSinglePage = YES;
        _pageControl.currentPageIndicatorTintColor = RGBACOLOR(200, 200, 200, 0.7);
        _pageControl.pageIndicatorTintColor = RGBACOLOR(200, 200, 200, 0.25);
    }
    return _pageControl;
}

@end
