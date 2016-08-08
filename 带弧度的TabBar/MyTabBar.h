//
//  MyTabBar.h
//  带弧度的TabBar
//
//  Created by apple on 16/8/8.
//  Copyright © 2016年 happy. All rights reserved.
//

#import <UIKit/UIKit.h>


@class MyTabBar;
@protocol MyTabBarDelegate <NSObject>

- (void)tabBar:(MyTabBar *)tabBar didSelectItemAtIndex:(NSInteger)index;

@end

@interface MyTabBar : UIView

/* 选中的索引 */
@property (nonatomic,assign) NSInteger selectedIndex;;
/* 数据模型 */
@property (nonatomic,strong) NSArray *items;
/* 代理 */
@property (nonatomic,weak) id <MyTabBarDelegate>delegate;

@end
