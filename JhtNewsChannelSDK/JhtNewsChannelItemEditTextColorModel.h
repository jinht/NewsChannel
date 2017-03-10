//
//  JhtNewsChannelItemEditTextColorModel.h
//  JhtNewsChannelDemo
//
//  GitHub主页: https://github.com/jinht
//  CSDN博客: http://blog.csdn.net/anticipate91
//
//  Created by Jht on 2016/12/16.
//  Copyright © 2016年 JhtNewsChannelDemo. All rights reserved.
//

#import <UIKit/UIKit.h>

/** 排序界面_文字颜色_参数model */
@interface JhtNewsChannelItemEditTextColorModel : NSObject

#pragma mark optional
/** 排序界面 顶部删除完成按钮 borderColor 颜色*/
@property (nonatomic, strong) UIColor *itemEditConfirmButtonBorderColor;
/** 排序界面 顶部删除完成按钮 文字颜色 颜色 */
@property (nonatomic, strong) UIColor *itemEditConfirmButtonTitleColor;

/** 排序界面 @"栏目切换" 文字颜色*/
@property (nonatomic, strong) UIColor *itemEditTipsLabelTextColor;
/** 排序界面 @"点击添加更多栏目" 文字颜色 */
@property (nonatomic, strong) UIColor *itemEditAddTipViewTextColor;

/** 选中频道Btn title的颜色 */
@property (nonatomic, strong) UIColor *itemEditChannelBtnSelectedBtnTitleColor;
/** 未选中频道Btn title的颜色 */
@property (nonatomic, strong) UIColor *itemEditChannelBtnNormalBtnTitleColor;

/** 每一个频道 边框颜色（最好与删除按钮颜色相同） */
@property (nonatomic, strong) UIColor *itemBtnBorderColor;


@end
