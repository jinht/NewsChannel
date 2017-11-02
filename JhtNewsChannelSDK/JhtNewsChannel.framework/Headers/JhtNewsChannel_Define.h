//
//  JhtNewsChannel_Define.h
//  JhtNewsChannelDemo
//
//  GitHub主页: https://github.com/jinht
//  CSDN博客: http://blog.csdn.net/anticipate91
//
//  Created by Jht on 2017/10/15.
//  Copyright © 2017年 JhtNewsChannelDemo. All rights reserved.
//

#ifndef JhtNewsChannel_Define_h
#define JhtNewsChannel_Define_h

/** 屏幕的宽度*/
#define FrameW [UIScreen mainScreen].bounds.size.width
/** 屏幕的高度 */
#define FrameH [UIScreen mainScreen].bounds.size.height

/** 状态栏(StatusBar) 高度 */
#define KNCDStatusBarHeight [[UIApplication sharedApplication] statusBarFrame].size.height
/** 导航栏 高度 */
#define KNCDNavBarHeight CGRectGetHeight(self.navigationController.navigationBar.frame)

/** 颜色转换 */
#define UIColorFromRGB(rgbValue) [UIColor \
colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0xFF00) >> 8))/255.0 \
blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]


#endif /* JhtNewsChannel_Define_h */
