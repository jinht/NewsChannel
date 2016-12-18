//
//  JhtNewsChannelItemEditDistanceModel.h
//  JhtNewsChannelDemo
//
//  GitHub主页: https://github.com/jinht
//  CSDN博客: http://blog.csdn.net/anticipate91
//
//  Created by Jht on 2016/12/16.
//  Copyright © 2016年 JhtNewsChannelDemo. All rights reserved.
//

#import <UIKit/UIKit.h>

/** 排序界面_距离_参数model */
@interface JhtNewsChannelItemEditDistanceModel : NSObject

/** 顶部条 高度 */
@property (nonatomic, assign) CGFloat itemEditTopPartHeight;
/** 中间已选和未选部分中间view 高度 */
@property (nonatomic, assign) CGFloat itemEditAddTipViewPartHeight;

/** 每个频道的 宽度 */
@property (nonatomic, assign) CGFloat itemEditChannelItemW;
/** 每个频道的 高度 */
@property (nonatomic, assign) CGFloat itemEditChannelItemH;
/** 频道间 纵向间距 */
@property (nonatomic, assign) CGFloat itemEditChannelMarginH;

/** 每行的 频道个数 */
@property (nonatomic, assign) NSInteger itemEditRowChannelItemNum;

/** 频道按钮的弧度 */
@property (nonatomic, assign) CGFloat itemEditChannelBtnCornerRadius;


@end
