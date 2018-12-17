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
#import "JhtTotalSlideViewDelegate.h"

/** 总的滚动View(频道栏+主View) */
@interface JhtTotalSlideView : UIView

#pragma mark - property
/** 频道栏与VC之间的距离 */
@property (nonatomic, assign) CGFloat channelBarBottomSpace;
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

@property (nonatomic, weak) id<JhtTotalSlideViewDelegate> delegate;



#pragma mark - Public Method
/** 奔跑吧 */
- (void)running;


@end
