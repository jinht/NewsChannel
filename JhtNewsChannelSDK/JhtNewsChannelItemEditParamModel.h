//
//  JhtNewsChannelItemEditParamModel.h
//  JhtNewsChannelDemo
//
//  GitHub主页: https://github.com/jinht
//  CSDN博客: http://blog.csdn.net/anticipate91
//
//  Created by Jht on 16/8/30.
//  Copyright © 2016年 JhtNewsChannelDemo. All rights reserved.
//

#import "JhtNewsChannelItemEditTextModel.h"
#import "JhtNewsChannelItemEditDistanceModel.h"
#import "JhtNewsChannelItemEditTextColorModel.h"
#import "JhtNewsChannelItemEditBackgroundColorModel.h"

/** 排序界面_参数model */
@interface JhtNewsChannelItemEditParamModel : NSObject

#pragma mark required
/** 是否存在删除btn（排序删除，或者只有排序没有删除） Yes：存在删除 */
@property (nonatomic, assign) BOOL isExistDelete;


#pragma mark optional
/** 排序界面_背景颜色_参数model */
@property (nonatomic, strong) JhtNewsChannelItemEditBackgroundColorModel *backgroundColorItemModel;
/** 排序界面_文字颜色_参数model */
@property (nonatomic, strong) JhtNewsChannelItemEditTextColorModel *textColorItemModel;
/** 排序界面_距离_参数model */
@property (nonatomic, strong) JhtNewsChannelItemEditDistanceModel *distanceItemModel;
/** 排序界面_文字类_设置参数model */
@property (nonatomic, strong) JhtNewsChannelItemEditTextModel *textTitleItemModel;


@end
