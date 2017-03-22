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
/** 频道栏编辑的时删除最后一个频道的提示语
 *  default：@"就一个了，你别给我删除了啊，好歹留一个啊！😜"
 */
@property (nonatomic, strong) NSString *itemEditDeleteLastChannelItemHint;
/** 排序界面 已选 和 未选 中间标签的 文字
 *  default：@"点击添加更多栏目"
 */
@property (nonatomic, strong) NSString *itemMiddleText;
/** 排序界面 顶部排序 左上角标题
 *  default：@"栏目切换"
 */
@property (nonatomic, strong) NSString *itemTopTitleText;
/** 排序界面 右上角 完成 文字 
 *  default：@"完成"
 */
@property (nonatomic, strong) NSString *itemSortCompletedText;
/** 排序界面 不存在频道删除功能时 频道栏右上角 显示的 文字
 *  default：@"拖拽排序"
 */
@property (nonatomic, strong) NSString *itemSortNotExistDeleteText;
/** 排序界面 存在频道删除功能时 频道栏右上角 显示的 文字 
 *  default：@"排序删除"
 */
@property (nonatomic, strong) NSString *itemSortIsExistDeleteText;


@end
