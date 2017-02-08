//
//  JhtNewsChannelItemEditTextModel.h
//  JhtNewsChannelDemo
//
//  GitHub主页: https://github.com/jinht
//  CSDN博客: http://blog.csdn.net/anticipate91
//
//  Created by Jht on 2016/12/16.
//  Copyright © 2016年 JhtNewsChannelDemo. All rights reserved.
//

#import <UIKit/UIKit.h>

/** 排序界面_文字类_设置参数model */
@interface JhtNewsChannelItemEditTextModel : NSObject

#pragma mark optional
/** 频道栏编辑的时删除最后一个频道的提示语 */
@property (nonatomic, copy) NSString *itemEditDeleteLastChannelItemHint;
/** 排序界面 已选 和 未选 中间标签的 文字 */
@property (nonatomic, copy) NSString *itemMiddleText;

/** 排序界面 顶部排序 左上角标题 */
@property (nonatomic, copy) NSString *itemTopTitleText;
/** 排序界面 右上角 完成 文字 */
@property (nonatomic, copy) NSString *itemSortCompletedText;

/** 排序界面 不存在频道删除功能时 频道栏右上角 显示的 文字 */
@property (nonatomic, copy) NSString *itemSortNotExistDeleteText;
/** 排序界面 存在频道删除功能时 频道栏右上角 显示的 文字 */
@property (nonatomic, copy) NSString *itemSortIsExistDeleteText;


@end
