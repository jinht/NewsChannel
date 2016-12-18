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

/** 频道栏 编辑背景颜色（整体背景） */
@property (nonatomic, strong) UIColor *itemEditBackgroundColor;
/** 频道栏 顶部栏目的背景 */
@property (nonatomic, strong) UIColor *itemEditTopPartBackgroundColor;
/** 每一个占位背景的颜色 */
@property (nonatomic, strong) UIColor *itemEditPlaceholderViewBgColor;
/** 已选 和 未选 中间标签的 背景颜色 */
@property (nonatomic, strong) UIColor *itemMiddleBackgroundColor;


@end
