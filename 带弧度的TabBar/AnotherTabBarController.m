

//
//  AnotherTabBarController.m
//  带弧度的TabBar
//
//  Created by apple on 16/8/7.
//  Copyright © 2016年 happy. All rights reserved.
//

#import "AnotherTabBarController.h"
#import "MyTabBar.h"

// 自定义log
#ifdef DEBUG

#define DLog(...) NSLog(@"%s %d \n %@\n\n",__func__,__LINE__,[NSString stringWithFormat:__VA_ARGS__])

#else

#define DLog(...)

#endif

// 设置颜色
#define BXColor(r, g, b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]
// 随机色
#define BXRandomColor BXColor(arc4random_uniform(256), arc4random_uniform(256), arc4random_uniform(256))

@interface AnotherTabBarController ()<MyTabBarDelegate,UINavigationControllerDelegate>

/* 标签栏 */
@property (nonatomic,strong) MyTabBar *myTabBar;
/* 保存所有控制器Item */
@property (nonatomic,strong) NSMutableArray *items;

@end

@implementation AnotherTabBarController

+(void)initialize
{
    //设置 tabBarItem 的普通的文字
    NSMutableDictionary *textAttrs = [NSMutableDictionary dictionary];
    textAttrs[NSForegroundColorAttributeName] = [[UIColor alloc]initWithRed:113/255.0 green:109/255.0 blue:104/255.0 alpha:1];
    textAttrs[NSFontAttributeName] = [UIFont systemFontOfSize:10];
    
    
    //设置tabBarItem的选中文字颜色
    NSMutableDictionary *selectedTextAttrs = [NSMutableDictionary dictionary];
    selectedTextAttrs[NSForegroundColorAttributeName] = BXColor(51, 135, 255);
    
    UITabBarItem *item = [UITabBarItem appearance];
    [item setTitleTextAttributes:textAttrs forState:UIControlStateNormal];
    [item setTitleTextAttributes:selectedTextAttrs forState:UIControlStateSelected];
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    //隐藏系统的 tabBar
    self.tabBar.hidden = YES;
    //把系统的 tabbar 上的按钮干掉
    [self.tabBar removeFromSuperview];
    for (UIView *childView in self.tabBar.subviews) {
        if (![childView isKindOfClass:[MyTabBar class]]) {
            [childView removeFromSuperview];
        }
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self configChildControllers];
    
    [self configTabBar];
}

- (void)configChildControllers
{
    NSMutableArray *arr = [NSMutableArray array];
    //初始化子控制器
    UIViewController *firstVC = [[UIViewController alloc] init];
    firstVC.view.backgroundColor = BXRandomColor;
    UINavigationController *navi = [self addChildController:firstVC title:@"轨迹导航" imageName:@"tabbar_1" selectedImageName:@"tabbar_1"];
    [arr addObject:navi];
    
    UIViewController *twoVC = [[UIViewController alloc] init];
    twoVC.view.backgroundColor = BXRandomColor;
    UINavigationController *navi1 = [self addChildController:twoVC title:@"大数据" imageName:@"tabbar_2" selectedImageName:@"tabbar_2"];
    [arr addObject:navi1];
    
    UIViewController *centerVC = [[UIViewController alloc]init];
    centerVC.view.backgroundColor = BXRandomColor;
    UINavigationController *navi2 = [self addChildController:centerVC title:@"" imageName:@"funfit" selectedImageName:@"funfit_seleted"];
    [arr addObject:navi2];
    
    UIViewController *fourVC = [[UIViewController alloc] init];
    fourVC.view.backgroundColor = BXRandomColor;
    UINavigationController *navi3 = [self addChildController:fourVC title:@"手表助手" imageName:@"tabbar_3" selectedImageName:@"tabbar_3"];
    [arr addObject:navi3];
    
    UIViewController *fiveVC = [[UIViewController alloc] init];
    fiveVC.view.backgroundColor = BXRandomColor;
    UINavigationController *navi4 = [self addChildController:fiveVC title:@"设置" imageName:@"tabbar_1" selectedImageName:@"tabbar_1"];
    [arr addObject:navi4];
    
    self.viewControllers = arr;
    
    NSLog(@"%@",self.viewControllers);
}
- (UINavigationController *)addChildController:(UIViewController *)childCtrl title:(NSString *)title imageName:(NSString *)imageName selectedImageName:(NSString *)selectedImageName
{
    childCtrl.tabBarItem.title = title;
    childCtrl.tabBarItem.image = [UIImage imageNamed:imageName];
    childCtrl.tabBarItem.selectedImage = [[UIImage imageNamed:selectedImageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    [self.items addObject:childCtrl.tabBarItem];
    
    UINavigationController *navi = [[UINavigationController alloc] initWithRootViewController:childCtrl];
    return navi;
}

- (void)configTabBar
{
    MyTabBar *tabBar = [[MyTabBar alloc] init];
    tabBar.items = self.items;
    tabBar.delegate = self;
    tabBar.backgroundColor = [UIColor colorWithRed:37/255.0 green:39/255.0 blue:42/255.0 alpha:1.0];
    tabBar.frame = self.tabBar.frame;
    [self.view addSubview:tabBar];
    self.myTabBar = tabBar;
}

- (void)tabBar:(MyTabBar *)tabBar didSelectItemAtIndex:(NSInteger)index
{
    [super setSelectedIndex:index];
}

- (void)setSelectedIndex:(NSUInteger)selectedIndex
{
    self.myTabBar.selectedIndex = selectedIndex;
}

- (NSMutableArray *)items
{
    if (!_items) {
        _items = [NSMutableArray array];
    }
    return _items;
}


@end
