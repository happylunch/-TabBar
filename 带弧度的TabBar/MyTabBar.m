


//
//  MyTabBar.m
//  带弧度的TabBar
//
//  Created by apple on 16/8/8.
//  Copyright © 2016年 happy. All rights reserved.
//

#import "MyTabBar.h"
#import "MyTabBarItem.h"

#define BXColor(r, g, b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]

static NSInteger const TabBarTag = 12345;

@interface MyTabBar ()

/*  */
@property (nonatomic,strong) UIButton *selectItem;

@end

@implementation MyTabBar

- (void)setItems:(NSArray *)items
{
    _items = items;
    for (int i=0; i<items.count; i++) {
        UITabBarItem *item = items[i];
        if (i == 2) {
            UIButton *btn = [[UIButton alloc] init];
            [btn setImage:item.image forState:UIControlStateNormal];
            [btn setImage:item.selectedImage forState:UIControlStateSelected];
            
            btn.adjustsImageWhenHighlighted = NO;
            btn.tag = TabBarTag + i;
            [btn setTitle:item.title forState:UIControlStateNormal];
            [btn setTitleColor:BXColor(113, 109, 104) forState:UIControlStateNormal];
            [btn setTitleColor:BXColor(51, 135, 255) forState:UIControlStateSelected];
            [btn addTarget:self action:@selector(selectItem:) forControlEvents:UIControlEventTouchDown];
            [self addSubview:btn];

        }else
        {
            
            MyTabBarItem *itemBtn = [MyTabBarItem buttonWithType:UIButtonTypeCustom];
            [itemBtn setImage:item.image forState:UIControlStateNormal];
            [itemBtn setImage:item.selectedImage forState:UIControlStateSelected];
            itemBtn.adjustsImageWhenHighlighted = NO;
            itemBtn.tag = TabBarTag + i;
            [itemBtn setTitle:item.title forState:UIControlStateNormal];
            [itemBtn setTitleColor:BXColor(113, 109, 104) forState:UIControlStateNormal];
            [itemBtn setTitleColor:BXColor(51, 135, 255) forState:UIControlStateSelected];
            [itemBtn addTarget:self action:@selector(selectItem:) forControlEvents:UIControlEventTouchDown];
            [self addSubview:itemBtn];
            if (i == 1) {
                [self selectItem:itemBtn];
            }
        }
    }
}
- (void)selectItem:(UIButton *)itemBtn
{
    _selectItem.selected = NO;
    itemBtn.selected = YES;
    _selectItem = itemBtn;
    
    if ([self.delegate respondsToSelector:@selector(tabBar:didSelectItemAtIndex:)]) {
        [self.delegate tabBar:self didSelectItemAtIndex:itemBtn.tag - TabBarTag];
    }
}

- (void)setSelectedIndex:(NSInteger)selectedIndex
{
    _selectedIndex = selectedIndex;
    MyTabBarItem *btn = [self viewWithTag:selectedIndex];
    [self selectItem:btn];
}
- (void)layoutSubviews
{
    [super layoutSubviews];
    NSInteger count = self.subviews.count;
    CGFloat x = 0;
    CGFloat y = 0;
    CGFloat w = [UIScreen mainScreen].bounds.size.width/count;
    CGFloat h = self.frame.size.height;
    
    //修改中间按钮的大小
    for (int i = 0; i < count; i++) {
        UIButton *btn = self.subviews[i];
        x = i * w;
        if (i == 2) {
            y = -10;
            h = self.frame.size.height + 12;
             //btn.imageView.frame = CGRectMake((btn.frame.size.width - btn.currentImage.size.width)/2, btn.frame.origin.y/2, btn.currentImage.size.width, btn.currentImage.size.height);
        }else{
            y = 0;
            h = self.frame.size.height;
        }
        btn.frame = CGRectMake(x, y, w, h);
    }
}

-(UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event
{
    // 这里宽度应该跟突出部分的宽度一样，减少点击反应区域
    CGFloat pointW = 48;
    CGFloat pointH = 61;
    CGFloat pointX = ([UIScreen mainScreen].bounds.size.width - pointW) / 2;
    CGFloat pointY = -10;
    CGRect rect = CGRectMake(pointX, pointY+10, pointW, pointH);
    if (CGRectContainsPoint(rect, point)) {
        return [self viewWithTag:TabBarTag+2];
    }
    
    self.backgroundColor = [UIColor colorWithRed:37/255.0 green:39/255.0 blue:42/255.0 alpha:1.0];
    return [super hitTest:point withEvent:event];
}

@end
