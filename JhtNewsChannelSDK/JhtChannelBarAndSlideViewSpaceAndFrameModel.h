//
//  JhtChannelBarAndSlideViewSpaceAndFrameModel.h
//  JhtNewsChannelDemo
//
//  GitHub主页: https://github.com/jinht
//  CSDN博客: http://blog.csdn.net/anticipate91
//
//  Created by Jht on 2016/12/16.
//  Copyright © 2016年 JhtNewsChannelDemo. All rights reserved.
//

#import <UIKit/UIKit.h>

/** 频道栏&&sliderView_间距和坐标_参数model */
@interface JhtChannelBarAndSlideViewSpaceAndFrameModel : NSObject

/** sliderView的坐标 */
@property (nonatomic, assign) CGRect sliderFrame;

/** 顶部频道栏的坐标 */
@property (nonatomic, assign) CGRect topBarFrame;

/** 频道栏之间横向间距 */
@property (nonatomic, assign) CGFloat itemSpace;
/** 频道栏与VC之间的距离 */
@property (nonatomic, assign) CGFloat channelBarBottomSpace;
/** 频道栏两边空白距离 */
@property (nonatomic, assign) CGFloat itemTopBarSpace;

/** 小红点的宽度 */
@property (nonatomic, assign) CGFloat itemRedWidth;
/** 小红点和字之间的距离 */
@property (nonatomic, assign) CGFloat itemLabelToRedSpace;


@end
