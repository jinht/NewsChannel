//
//  JhtBaseViewController.h
//  JhtTools
//
//  GitHub主页: https://github.com/jinht
//  CSDN博客: http://blog.csdn.net/anticipate91
//
//  Created by Jht on 16/8/12.
//  Copyright © 2016年 JhtTools. All rights reserved.
//

#import <UIKit/UIKit.h>

// view的frame
/** 屏幕的宽度*/
#define FrameW [UIScreen mainScreen].bounds.size.width
/** 屏幕的高度 */
#define FrameH [UIScreen mainScreen].bounds.size.height
/** 375的比例尺 */
#define WidthScale375 (FrameW / 375)

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

/** 创建Navigationbar的TitleView */
- (void)createNavigationBarTitleViewWithLabelTitle:(NSString *)title;


@end
