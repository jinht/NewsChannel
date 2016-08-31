//
//  JhtChannelBarAndSlideViewConnectModel.h
//  JhtNewsChannelDemo
//
//  Created by Jht on 16/8/30.
//  Copyright © 2016年 JhtNewsChannelDemo. All rights reserved.
//

#import <UIKit/UIKit.h>

/** 用于JhtChannelBarAndSlideViewConnect 设置的参数model */
@interface JhtChannelBarAndSlideViewConnectParamModel : NSObject

/** sliderView的坐标 */
@property (nonatomic, assign) CGRect sliderFrame;
/** 顶部频道条的坐标 */
@property (nonatomic, assign) CGRect topBarFrame;
/** 频道栏之间横向间距 */
@property (nonatomic, assign) CGFloat itemSpace;
/** 频道栏与VC之间的距离 */
@property (nonatomic, assign) float channelBarBottomSpace;

/** 缓存的页数 */
@property (nonatomic, assign) NSInteger cacheCount;

/** 频道常规颜色 */
@property (nonatomic, strong) UIColor *itemNormalColor;
/** 频道被选中的颜色 */
@property (nonatomic, strong) UIColor *itemSelectedColor;
/** 未选中的 字号 */
@property (nonatomic, strong) UIFont *itemNormalFont;
/** 选中的字号 */
@property (nonatomic, strong) UIFont *itemSelectedFont;


/** 频道条两边空白距离 */
@property (nonatomic, assign) CGFloat itemTopBarSpace;
/** 小红点的宽度 */
@property (nonatomic, assign) CGFloat itemRedWidth;
/** 小红点和字之间的距离 */
@property (nonatomic, assign) CGFloat itemLabelToRedSpace;

/** 轨道颜色 */
@property (nonatomic, strong) UIColor *trackColor;
/** 选中的索引值 */
@property (nonatomic, assign) NSInteger selectedIndex;

/** 频道数组 */
@property (nonatomic, strong) NSMutableArray *channelArray;
/** 不能移动的名字数组 */
@property (nonatomic, strong) NSMutableArray *notMoveNameArray;
/** 上级传过来，装有ChannelModel 待添加的数组 */
@property (nonatomic, strong) NSMutableArray *toAddItemArray;

/** 是否添加频道栏尾部的加号Btn */
@property (nonatomic, assign) BOOL isAddTailBtn;
/** 尾部用于排序的加号按钮的坐标 */
@property (nonatomic, assign) CGRect channelBarTailBtnFrame;
/** 尾部用于排序的加号按钮 的图片 */
@property (nonatomic, strong) UIImage *channelBarTailBtnAddImageViewImage;

/** 是否存在删除btn yes是存在删除 */
@property (nonatomic, assign) BOOL isExistDelete;


@end
