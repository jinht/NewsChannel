//
//  JhtNewsChannelItemEditParamModel.h
//  JhtNewsChannelDemo
//
//  Created by Jht on 16/8/30.
//  Copyright © 2016年 JhtNewsChannelDemo. All rights reserved.
//

#import <UIKit/UIKit.h>

/** 用于排序界面中相关设置参数model */
@interface JhtNewsChannelItemEditParamModel : NSObject

/** 顶部排序删除部分高度 */
@property (nonatomic, assign) CGFloat itemEditTopPartHeight;
/** 中间已选部分和未选部分中间view 高度 */
@property (nonatomic, assign) CGFloat itemEditAddTipViewPartHeight;

/** 每个频道的 宽度 */
@property (nonatomic, assign) CGFloat itemEditChannelItemW;
/** 每个频道的 高度 */
@property (nonatomic, assign) CGFloat itemEditChannelItemH;

/** 频道间 纵向间距 */
@property (nonatomic, assign) CGFloat itemEditChannelMarginH;
/** 每行的 频道个数 */
@property (nonatomic, assign) NSInteger itemEditRowChannelItemNum;

/** 选中频道Btn title的颜色 */
@property (nonatomic, strong) UIColor *itemEditChannelBtnSelectedBtnTitleColor;
/** 未选中频道Btn title的颜色 */
@property (nonatomic, strong) UIColor *itemEditChannelBtnNormalBtnTitleColor;

/** 每一个占位背景的颜色 */
@property (nonatomic, strong) UIColor *itemEditPlaceholderViewBgColor;
/** 频道按钮的弧度 */
@property (nonatomic, assign) CGFloat itemEditChannelBtnCornerRadius;

/** 频道栏编辑的时候删除最后一个频道时候的提示语 */
@property (nonatomic, copy) NSString *itemEditDeleteLastChannelItemHint;


@end
