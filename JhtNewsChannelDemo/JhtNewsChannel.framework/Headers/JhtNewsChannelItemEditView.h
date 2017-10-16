//
//  JhtNewsChannelItemSortView.h
//  JhtNewsChannelDemo
//
//  GitHub主页: https://github.com/jinht
//  CSDN博客: http://blog.csdn.net/anticipate91
//
//  Created by Jht on 16/8/9.
//  Copyright © 2016年 JhtNewsChannelDemo. All rights reserved.
//

#import <UIKit/UIKit.h>
@class JhtNewsChannelItemModel;
@class JhtNewsChannelItemEditParamModel;

/** 频道栏编辑View */
@interface JhtNewsChannelItemEditView : UIView
#pragma mark - Block
/** 返回上级页面的 回调 
 *  modelArr：已添加（上部分）的modelArr
 *  toAddNewModelArr：未添加（下部分）的modelArr
 *  selectIndex：选中的index
 */
typedef void(^SortViewPop)(NSArray *modelArr, NSArray *nameArray, NSInteger selectIndex, NSArray *toAddNewModelArr);

/** 用于选中通知的block */
typedef void(^NoticeBlock)();



#pragma mark - Property
/** scrollView */
@property (nonatomic, strong) UIScrollView *sortBigScrollView;
/** 透明view */
@property (nonatomic, strong) UIButton *sortBackViewBtn;
/** 上级传过来的，装有ChannelModel的数组 */
@property (nonatomic, strong) NSMutableArray *topBarItemArray;
/** 上级传过来，装有ChannelModel 待添加的数组 */
@property (nonatomic, strong) NSMutableArray *toAddItemModelArray;
/** 选中的名字 */
@property (nonatomic, strong) NSString *selecteName;
/** 顶部栏的背景View */
@property (nonatomic, strong) UIView *topPartBackView;
/** @"栏目切换"Label */
@property (nonatomic, strong) UILabel *tipsLabel;
/** 排序删除按钮 */
@property (nonatomic, strong) UIButton *confirmButton;
/** 固定位置频道名字的数组 */
@property (nonatomic, strong) NSArray *notMoveNameArr;
/** 是否存在删除btn  yes是存在删除 */
@property (nonatomic, assign) BOOL isExistDelete;
/** 用于排序界面参数model */
@property (nonatomic, strong) JhtNewsChannelItemEditParamModel *itemEditModel;



#pragma mark - Public Method
/** 初始化
 *  block：用于返回上级页面的 回调
 *  noticeBlock：用于选中通知的block
 *  topBarItemArray：装有ChannelModel的数组
 *  name：选中的名字
 *  notMoveArr：不能移动的名字数组
 *  isExistDelete：是否存在删除按钮 yes是存在删除
 *  ToAddItemArray：待添加的数组
 * 	itemEditModel：用于排序界面的参数设置
 */
- (id)initWithTopBarItemArray:(NSArray *)topBarItemArray withToAddItemArray:(NSArray *)toAddItemArray withSelectedName:(NSString *)name withNotMoveNameArray:(NSArray *)notMoveArr isExistDeleteBtn:(BOOL)isExistDelete withNewsChannelItemEditModel:(JhtNewsChannelItemEditParamModel *)itemEditModel withSortBlock:(SortViewPop)block withNoticeBlock:(NoticeBlock)noticeBlock;

/** 收起自己 */
- (void)packUpSelf;


@end
