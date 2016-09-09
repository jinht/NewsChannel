//
//  JhtNewsChannelItemModel.h
//  JhtNewsChannelDemo
//
//  GitHub主页: https://github.com/jinht
//  CSDN博客: http://blog.csdn.net/anticipate91
//
//  Created by Jht on 16/7/18.
//  Copyright © 2016年 JhtNewsChannelDemo. All rights reserved.
//

#import <UIKit/UIKit.h>

/** 顶部频道Model */
@interface JhtNewsChannelItemModel : NSObject

/** title */
@property (nonatomic, copy) NSString *titleName;
/** 是否显示小红点 */
@property (nonatomic, assign) BOOL isShowRedPoint;


@end
