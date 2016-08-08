

//
//  MainTabBarController.m
//  带弧度的TabBar
//
//  Created by apple on 16/8/7.
//  Copyright © 2016年 happy. All rights reserved.
//

#import "MainTabBarController.h"

@interface MainTabBarController ()

@end

@implementation MainTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, -8, self.tabBar.frame.size.width, self.tabBar.frame.size.height+4)];
    NSLog(@"%@",NSStringFromCGRect(self.tabBar.frame));
    
    [imageView setImage:[[UIImage imageNamed:@"tabbar_bg"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    
    [imageView setContentMode:UIViewContentModeCenter];
    [self.tabBar insertSubview:imageView atIndex:0];
    //
    [[UITabBar appearance] setShadowImage:[self createImageWithColor:[UIColor clearColor]]];
    [[UITabBar appearance] setBackgroundImage:[self createImageWithColor:[UIColor clearColor]]];
    UITabBar.appearance.tintColor = [UIColor orangeColor];

    [self setupViewControllers];
}

- (void)setupViewControllers
{
    NSMutableArray *arr = [[NSMutableArray alloc] init];
    
    UIViewController *vc1 = [[UIViewController alloc] init];
    UITabBarItem *item1 = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemFeatured tag:0];
    vc1.tabBarItem = item1;
    vc1.view.backgroundColor = [UIColor yellowColor];
    UINavigationController *nav1 = [[UINavigationController alloc] initWithRootViewController:vc1];
    [arr addObject:nav1];
    
    UIViewController *vc2 = [[UIViewController alloc] init];
    UITabBarItem *item2 = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemFeatured tag:1];
    vc2.view.backgroundColor = [UIColor greenColor];
    vc2.tabBarItem = item2;
    UINavigationController *nav2 = [[UINavigationController alloc] initWithRootViewController:vc2];
    [arr addObject:nav2];
    
    UIViewController *vc3 = [[UIViewController alloc] init];
    UITabBarItem *item3 = [[UITabBarItem alloc] init];
    item3.image = [[UIImage imageNamed:@"btn_card"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    item3.selectedImage = [[UIImage imageNamed:@"btn_card"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] ;
    
    
    vc3.view.backgroundColor = [UIColor redColor];
    vc3.tabBarItem = item3;
    UINavigationController *nav3 = [[UINavigationController alloc] initWithRootViewController:vc3];
    [arr addObject:nav3];
    
    UIViewController *vc4 = [[UIViewController alloc] init];
    UITabBarItem *item4 = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemFeatured tag:0];
    vc4.view.backgroundColor = [UIColor purpleColor];
    vc4.tabBarItem = item4;
    UINavigationController *nav4 = [[UINavigationController alloc] initWithRootViewController:vc4];
    [arr addObject:nav4];
    
    UIViewController *vc5 = [[UIViewController alloc] init];
    UITabBarItem *item5 = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemFeatured tag:0];
    vc5.view.backgroundColor = [UIColor cyanColor];
    vc5.tabBarItem = item5;
    UINavigationController *nav5 = [[UINavigationController alloc] initWithRootViewController:vc5];
    [arr addObject:nav5];
    
    self.viewControllers = arr;
}


- (UIImage *)createImageWithColor:(UIColor *)color
{
//    UIGraphicsBeginImageContextWithOptions(CGSizeMake(1, 1), YES, [UIScreen mainScreen].scale);
//    CGRect imageRect = (CGRect){0, 0, 1, 1};
//    CGContextRef context = UIGraphicsGetCurrentContext();
//    CGContextSetFillColorWithColor(context, [color CGColor]);
//    CGContextFillRect(context, imageRect);
//    UIImage *finalImage = UIGraphicsGetImageFromCurrentImageContext();
//    UIGraphicsEndImageContext();
//    return finalImage;
    
    CGRect rect=CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return theImage;

}


@end
