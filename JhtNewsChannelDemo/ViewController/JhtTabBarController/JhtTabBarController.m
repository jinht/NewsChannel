
//
//  JhtTabBarController.m
//  JhtNewsChannelDemo
//
//  GitHub主页: https://github.com/jinht
//  CSDN博客: http://blog.csdn.net/anticipate91
//
//  Created by Jht on 2017/3/20.
//  Copyright © 2017年 JhtNewsChannelDemo. All rights reserved.
//

#import "JhtTabBarController.h"
#import "JhtNewsChannelViewController.h"
#import <JhtNewsChannel/JhtNewsChannel_Define.h>

@implementation JhtTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    // 修改TabBarItem字体大小
    [[UITabBarItem appearance] setTitleTextAttributes:@{NSFontAttributeName:[UIFont fontWithName:@"HelveticaNeue" size:14],NSForegroundColorAttributeName:UIColorFromRGB(0x61cbf5)} forState:UIControlStateNormal];
    [[UITabBarItem appearance] setTitleTextAttributes:@{NSFontAttributeName:[UIFont fontWithName:@"HelveticaNeue" size:14],NSForegroundColorAttributeName:UIColorFromRGB(0xFF001F)} forState:UIControlStateSelected];
    
    // 创建对应的VC
    [self tbvCreateControllers];
}

/** 创建对应的VC */
- (void)tbvCreateControllers {
    JhtNewsChannelViewController *vc1 = [[JhtNewsChannelViewController alloc] init];
    
    UIViewController *vc2 = [[UIViewController alloc] init];
    vc2.view.backgroundColor = [UIColor redColor];
    
    UIViewController *vc3 = [[UIViewController alloc] init];
    vc3.view.backgroundColor = [UIColor greenColor];
    
    NSArray *homeViewControllers = @[vc1, vc2, vc3];
    // 标题
    NSArray *titleArr = @[@"乔布斯", @"罗永浩", @"罗玉凤"];
    
    // 初始化数组
    NSMutableArray *controllers = [NSMutableArray array];
    
    // 循环增加Navigation
    for (NSInteger i = 0 ; i < titleArr.count; i ++) {
        UIViewController *vc = homeViewControllers[i];
        // 标题
        vc.title = titleArr[i];
        vc.tabBarItem.tag = i + 1;
        
        // 循环增加
        UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:homeViewControllers[i]];
        // 添加到数组中
        [controllers addObject:nav];
    }
    
    self.viewControllers = controllers;
    self.tabBar.tintColor = UIColorFromRGB(0xfd4444);
}


@end
