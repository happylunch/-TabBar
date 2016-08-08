

//
//  MyTabBarItem.m
//  带弧度的TabBar
//
//  Created by apple on 16/8/8.
//  Copyright © 2016年 happy. All rights reserved.
//

#import "MyTabBarItem.h"

@implementation MyTabBarItem

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // 1.设置字体
        self.titleLabel.font = [UIFont systemFontOfSize:10];
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        self.adjustsImageWhenHighlighted = NO;
        // 2.图片的内容模式
        self.imageView.contentMode = UIViewContentModeCenter;
    }
    return self;
}

- (void)setItem:(UITabBarItem *)item
{
    _item = item;
}


- (CGRect)titleRectForContentRect:(CGRect)contentRect
{
    return CGRectMake(0, self.frame.size.height - 16, self.frame.size.width, 16);
}
- (CGRect)imageRectForContentRect:(CGRect)contentRect
{
    return CGRectMake((self.frame.size.width - self.currentImage.size.width)/2, self.titleLabel.frame.origin.y - self.currentImage.size.height, self.currentImage.size.width, self.currentImage.size.height);
}

- (void)setHighlighted:(BOOL)highlighted
{
    
}

@end
