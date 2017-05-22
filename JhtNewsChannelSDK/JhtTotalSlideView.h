//
//  JhtTotalSlideView.h
//  JhtNewsChannelDemo
//
//  GitHub主页: https://github.com/jinht
//  CSDN博客: http://blog.csdn.net/anticipate91
//
//  Created by Jht on 16/8/17.
//  Copyright © 2016年 JhtNewsChannelDemo. All rights reserved.
//

#import <UIKit/UIKit.h>
@class JhtTotalSlideView;

#pragma mark - protocol
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
 *  modelArr：JhtNewsChannelItemModel数组
 *  nameArray：频道名字数组
 *  selectedIndex：选中的index
 */
- (void)JhtTotalSlideViewWithSortModelArr:(NSArray *)modelArr withNameArray:(NSArray *)nameArray withSelectIndex:(NSInteger)selectedIndex;

@end



/** 总的滚动View(频道栏+主View) */
@interface JhtTotalSlideView : UIView
#pragma mark - property
/** 频道栏与VC之间的距离 */
@property (nonatomic, assign) float channelBarBottomSpace;
/** 主View */
@property (nonatomic, strong) UIView *slideView;
/** 主View上的VC */
@property (nonatomic, weak) UIViewController *baseViewController;
/** 选中的索引值 */
@property (nonatomic, assign) NSInteger selectedIndex;
/** 频道栏 */
@property (nonatomic, strong) UIView *channelBar;
/** 缓存代理 */
@property (nonatomic, strong) id cache;

@property (nonatomic, weak) id<JhtTotalSlideViewDelegate>delegate;



#pragma mark - Public Method
/** 启动 */
- (void)startUp;


@end
