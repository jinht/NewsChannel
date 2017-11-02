//
//  JhtTotalSlideViewDelegate.h
//  JhtNewsChannelDemo
//
//  Created by Jht on 2017/10/31.
//  Copyright © 2017年 JhtNewsChannelDemo. All rights reserved.
//

#ifndef JhtTotalSlideViewDelegate_h
#define JhtTotalSlideViewDelegate_h

@class JhtTotalSlideView;
@class JhtNewsChannelItemModel;


/** 排序页面显示枚举 */
typedef NS_ENUM(NSUInteger, Jht_SortView_state) {
    // 将要展示排序页面
    sortView_willShow,
    // 已经展示出排序页面
    sortView_DidShow,
};


/** JhtTotalSlideView 委托 */
@protocol JhtTotalSlideViewDelegate <NSObject>
@required
/** VC总数量 */
- (NSInteger)numberOfTabsInJhtTotalSlideView:(JhtTotalSlideView *)sender;
/** 当前index下的VC */
- (UIViewController *)JhtTotalSlideView:(JhtTotalSlideView *)sender controllerAt:(NSInteger)index;

@optional
/** 点击VC的index */
- (void)JhtTotalSlideView:(JhtTotalSlideView *)sender didSelectedAt:(NSInteger)index;

/** 排序之后的操作
 *  modelArr：已添加数组
 *  nameArray：频道名字数组
 *  selectedIndex：选中的index
 *  toAddModelArr：未添加数组
 */
- (void)JhtTotalSlideViewWithSortModelArr:(NSArray<JhtNewsChannelItemModel *> *)modelArr withNameArray:(NSArray *)nameArray withSelectIndex:(NSInteger)selectedIndex withToAddModelArr:(NSArray<JhtNewsChannelItemModel *> *)toAddModelArr;

/** 排序页面显示状态
 *  showState：排序页面展示状态
 */
- (void)JhtSortViewShowState:(Jht_SortView_state)showState;

@end


#endif /* JhtTotalSlideViewDelegate_h */
