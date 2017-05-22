//
//  JhtChannelBarAndSlideViewConnect.h
//  JhtNewsChannelDemo
//
//  GitHub主页: https://github.com/jinht
//  CSDN博客: http://blog.csdn.net/anticipate91
//
//  Created by Jht on 16/8/18.
//  Copyright © 2016年 JhtNewsChannelDemo. All rights reserved.
//

#import "JhtTotalSlideView.h"
@class JhtNewsChannelItemEditParamModel;
@class JhtChannelBarAndSlideViewConnectParamModel;

/** 所在类是否含有NavigationBar || TabBar_枚举 */
typedef NS_ENUM(NSUInteger, NT_IsExist) {
    // 只含有NavigationBar（Default）
    NT_OnlyHave_N,
    // 只含有TabBar
    NT_OnlyHave_T,
    // NavigationBar && TabBar都含有
    NT_Have,
    // NavigationBar && TabBar都不含有
    NT_None
};


/** 频道栏和下边滚动View的结合体 */
@interface JhtChannelBarAndSlideViewConnect : JhtTotalSlideView
#pragma mark - property
/** 缓存总数 */
@property (nonatomic, assign) NSInteger cacheCount;
/** 频道数组 */
@property (nonatomic, strong) NSMutableArray *channelArray;
/** 上级传过来，装有ChannelModel 待添加的数组 */
@property (nonatomic, strong) NSMutableArray *toAddItemArray;

/** 是否添加频道栏尾部的加号Btn */
@property (nonatomic, assign) BOOL isAddTailBtn;
/** 频道栏尾部的Btn */
@property (nonatomic, strong) UIButton *channelBarTailBtn;

/** 排序界面View */
@property (nonatomic, strong) UIView *sortView;
/** 不能移动的名字数组 */
@property (nonatomic, strong) NSMutableArray *notMoveNameArray;
/** 是否存在删除btn  yes是存在删除 */
@property (nonatomic, assign) BOOL isExistDelete;

/** 轨道栏前边的阴影 */
@property (nonatomic, strong) UIImageView *frontImageView;
/** 轨道栏后边的阴影 */
@property (nonatomic, strong) UIImageView *behindImageView;
/** 频道栏之间横向间距 */
@property (nonatomic, assign) CGFloat itemSpace;
/** 底部的线 */
@property (nonatomic, strong) UILabel *lowLineLabel;
/** 用于排序界面参数model */
@property (nonatomic, strong) JhtNewsChannelItemEditParamModel *itemEditModel;

/** 整体距离顶部的高度
 *  注：只适用于NT_OnlyHave_T || NT_None 两种形式（即不存在navigationBar），default = 20.0
 */
@property (nonatomic, assign) CGFloat connectToTopSpace;



#pragma mark - Public Method
/** 创建ChannelBarAndSliderView和排序删除界面
 *  barAndSlideModel：用于设置sliderView和bar参数model（为了容错，含有部分属性默认值）
 *  itemEditModel：用于排序界面的参数设置（为了容错，含有部分属性默认值）
 *  withIsExistNavOrTab：是否含有NavigationBar || TabBar_枚举
 *  channelArray：已经添加的频道数组 存储JhtNewsChannelItemModel (必要参数，并且是存储JhtNewsChannelItemModel的数组)
 *  baseViewController：所处于的VC
 *  delegate：代理
 */
- (id)initSlideViewAndItemEditViewWithBarAndSlideModel:(JhtChannelBarAndSlideViewConnectParamModel *)barAndSlideModel withNewsChannelItemEditModel:(JhtNewsChannelItemEditParamModel *)itemEditModel withIsExistNavOrTab:(NT_IsExist)isExistType  withChanelArray:(NSMutableArray *)channelArray withBaseViewController:(id)baseViewController withDelegte:(id<JhtTotalSlideViewDelegate>)delegate;

/** 根据名字数组，得到新的频道栏model */
- (NSMutableArray *)getNewChannelItemModelWithNameArray:(NSArray *)nameArray;

/** 判断频道栏尾部按钮是否可以被点击
 *  enable：yes可以被点击
 */
- (void)judgeChannelBarTailBtnIsEnableClick:(BOOL)enable;

/** 隐藏或者出现小红点
 *  hidden：yes隐藏
 *  index：topBar 中频道栏的index
 */
- (void)redPonitIsHidden:(BOOL)hidden withIndex:(NSInteger)index;


@end
