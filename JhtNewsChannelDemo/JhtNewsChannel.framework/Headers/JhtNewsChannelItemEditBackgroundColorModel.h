//
//  JhtNewsChannelItemEditBackgroundColorModel.h
//  JhtNewsChannelDemo
//
//  GitHub主页: https://github.com/jinht
//  CSDN博客: http://blog.csdn.net/anticipate91
//
//  Created by Jht on 2016/12/16.
//  Copyright © 2016年 JhtNewsChannelDemo. All rights reserved.
//

#import <UIKit/UIKit.h>

/** 排序界面_背景颜色_参数model */
@interface JhtNewsChannelItemEditBackgroundColorModel : NSObject

#pragma mark optional
/** 频道栏 编辑背景颜色（整体背景） 
 *  default：[UIColor colorWithRed:1 green:1 blue:1 alpha:0.96]
 */
@property (nonatomic, strong) UIColor *itemEditBackgroundColor;
/** 频道栏 顶部栏目的背景 
 *  default：[UIColor whiteColor]
 */
@property (nonatomic, strong) UIColor *itemEditTopPartBackgroundColor;
/** 每一个占位背景的颜色 
 *  default：[UIColor colorWithRed:0.96f green:0.93f blue:0.91f alpha:1.00f]
 */
@property (nonatomic, strong) UIColor *itemEditPlaceholderViewBgColor;
/** 已选 和 未选 中间标签的 背景颜色 
 *  default：[UIColor colorWithRed:0.93f green:0.95f blue:0.96f alpha:1.00f]
 */
@property (nonatomic, strong) UIColor *itemMiddleBackgroundColor;


@end
