//
//  JhtChannelBarTailBtnModel.h
//  JhtNewsChannelDemo
//
//  GitHub主页: https://github.com/jinht
//  CSDN博客: http://blog.csdn.net/anticipate91
//
//  Created by Jht on 2016/12/16.
//  Copyright © 2016年 JhtNewsChannelDemo. All rights reserved.
//

#import <UIKit/UIKit.h>

/** 频道栏_尾部加号按钮_参数model */
@interface JhtChannelBarTailBtnModel : NSObject

#pragma mark required
/** 是否添加频道栏尾部的加号Btn */
@property (nonatomic, assign) BOOL isAddTailBtn;


#pragma mark optional
/** 尾部用于排序的加号按钮的坐标 
 *  default：CGRectMake(self.channelBar.frame.size.width, 0, FrameW - self.channelBar.frame.size.width, self.channelBar.frame.size.height)
 */
@property (nonatomic, assign) CGRect channelBarTailBtnFrame;
/** 尾部用于排序的加号按钮 的图片 
 *  default：[UIImage imageWithContentsOfFile:[[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:@"JhtNewsChannelImages.bundle/more"]]
 */
@property (nonatomic, strong) UIImage *channelBarTailBtnAddImageViewImage;


@end
