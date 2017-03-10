//
//  JhtNewsViewController.h
//  JhtNewsChannelDemo
//
//  GitHub主页: https://github.com/jinht
//  CSDN博客: http://blog.csdn.net/anticipate91
//
//  Created by Jht on 16/8/12.
//  Copyright © 2016年 JhtNewsChannelDemo. All rights reserved.
//

#import "JhtBaseViewController.h"

#pragma mark - protocol
@protocol JhtNewsViewControllerDelegate <NSObject>
/** 刷新结束后调用 */
- (void)refreshOver:(id)sender;

@end


/** 展示VC */
@interface JhtNewsViewController : JhtBaseViewController
#pragma mark - property
/** 代理 */
@property (nonatomic, assign) id<JhtNewsViewControllerDelegate> delegate;

/** 上级页面传过来的titleName */
@property (nonatomic, strong) NSString *titleName;



#pragma mark - Public Method
/** 暴露给外边的刷新方法 */
- (void)headerRefresh;


@end
