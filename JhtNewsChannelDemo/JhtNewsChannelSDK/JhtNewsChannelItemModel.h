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

@protocol JhtNewsChannelItemModel <NSObject>

@end


/** 频道Model */
@interface JhtNewsChannelItemModel : NSObject

#pragma mark required
/** title */
@property (nonatomic, strong) NSString *titleName;
/** 是否显示小红点 */
@property (nonatomic, assign) BOOL isShowRedPoint;


@end
