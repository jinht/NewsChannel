//
//  JhtBaseViewController.h
//  JhtNewsChannelDemo
//
//  GitHub主页: https://github.com/jinht
//  CSDN博客: http://blog.csdn.net/anticipate91
//
//  Created by Jht on 16/8/12.
//  Copyright © 2016年 JhtNewsChannelDemo. All rights reserved.
//

#import <UIKit/UIKit.h>

// view的frame
/** 屏幕的宽度*/
#define FrameW [UIScreen mainScreen].bounds.size.width
/** 屏幕的高度 */
#define FrameH [UIScreen mainScreen].bounds.size.height
/** 375的比例尺 */
#define WidthScale375 (([[UIScreen mainScreen] bounds].size.width)/375)

/** 动态获取导航栏的高度 */
#define navBarHeight self.navigationController.navigationBar.frame.size.height
/** 导航栏加状态栏的高度 */
#define KTopHeight 64

/** 颜色转换 */
#define UIColorFromRGB(rgbValue) [UIColor \
colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0xFF00) >> 8))/255.0 \
blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]


/** VC父类 */
@interface JhtBaseViewController : UIViewController

#pragma mark - Navigation
/** 创建导航栏左侧自定义的返回按钮 */
- (void)createNavigationBarLeftBtn;
/** 导航栏左侧返回按钮触发事件 */
- (void)popToFormerController;

/** 创建Navigationbar的TitleView */
- (void)createNavigationBarTitleViewWithLabelTitle:(NSString *)title;

/** 创建导航栏右侧自定义的返回按钮(有图标) */
- (void)createNavigationBarRightBtnWithRightImage:(UIImage *)RImage WithRightLabelText:(NSString *)RLText;
/** 导航栏右侧按钮点击触发事件(有图标) */
- (void)rightItemTapGes:(UITapGestureRecognizer *)ges;

/** 创建导航栏右侧侧自定义的按钮(无图标) */
- (void)createNavigationBarRightBtnWithLabelText:(NSString *)RLText;
/** 默认导航栏右侧按钮点击触发事件(无图标~子类可以重写) */
- (void)rightItemNoImageTapGes:(UITapGestureRecognizer *)ges;


@end
