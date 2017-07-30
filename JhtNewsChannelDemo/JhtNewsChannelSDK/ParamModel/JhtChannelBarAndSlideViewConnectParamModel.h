//
//  JhtChannelBarAndSlideViewConnectModel.h
//  JhtNewsChannelDemo
//
//  GitHub主页: https://github.com/jinht
//  CSDN博客: http://blog.csdn.net/anticipate91
//
//  Created by Jht on 16/8/30.
//  Copyright © 2016年 JhtNewsChannelDemo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JhtNewsChannelItemModel.h"
#import "JhtChannelBarTailBtnModel.h"
#import "JhtChannelBarColorAndFontModel.h"
#import "JhtChannelBarAndSlideViewSpaceAndFrameModel.h"

/** JhtChannelBarAndSlideViewConnect_参数model */
@interface JhtChannelBarAndSlideViewConnectParamModel : NSObject

#pragma mark required
/** 缓存的页数 */
@property (nonatomic, assign) NSInteger cacheCount;
/** 选中的索引值 */
@property (nonatomic, assign) NSInteger selectedIndex;

/** 待添加的数组<JhtNewsChannelItemModel> */
@property (nonatomic, strong) NSMutableArray<JhtNewsChannelItemModel> *toAddItemArray;
/** 不能移动删除频道的名字数组 */
@property (nonatomic, strong) NSMutableArray *notMoveNameArray;

/** 频道栏_尾部加号按钮_参数model */
@property (nonatomic, strong) JhtChannelBarTailBtnModel *channelTailBtnModel;


#pragma mark optional
/** 频道栏_颜色和字号类_参数model */
@property (nonatomic, strong) JhtChannelBarColorAndFontModel *channelColorAndFontModel;
/** 频道栏&&sliderView_间距和坐标_参数model */
@property (nonatomic, strong) JhtChannelBarAndSlideViewSpaceAndFrameModel *channelSpaceAndRectModel;


@end
