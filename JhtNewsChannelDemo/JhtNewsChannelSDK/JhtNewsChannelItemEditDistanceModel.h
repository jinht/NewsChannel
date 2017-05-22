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

#pragma mark optional
/** 排序界面总高度
 *  default：FrameH
 */
@property (nonatomic, assign) CGFloat itemEditTotalHeight;
/** 顶部空余的透明层，默认就和外层保持一致（正常使用默认值，不做任何设置） 
 *  default：20 || 64
 */
@property (nonatomic, assign) CGFloat itemEditTransparentHeight;
/** 顶部条（顶部排序删除按钮部分）高度 
 *  default：90 / 2.0
 */
@property (nonatomic, assign) CGFloat itemEditTopPartHeight;
/** 中间已选和未选部分中间view 高度 
 *  default：60 / 2.0
 */
@property (nonatomic, assign) CGFloat itemEditAddTipViewPartHeight;


/** 每个频道的 宽度 
 *  default：78
 */
@property (nonatomic, assign) CGFloat itemEditChannelItemW;
/** 每个频道的 高度 
 *  default：32
 */
@property (nonatomic, assign) CGFloat itemEditChannelItemH;


/** 频道间 纵向间距 
 *  default：15
 */
@property (nonatomic, assign) CGFloat itemEditChannelMarginH;
/** 每行的 频道个数 
 *  default：4
 */
@property (nonatomic, assign) NSInteger itemEditRowChannelItemNum;
/** 频道按钮的弧度 
 *  default：32 / 2.0;
 */
@property (nonatomic, assign) CGFloat itemEditChannelBtnCornerRadius;


@end
