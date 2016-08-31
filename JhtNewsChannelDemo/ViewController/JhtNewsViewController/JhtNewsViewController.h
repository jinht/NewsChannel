//
//  JhtNewsViewController.h
//  JhtNewsChannelDemo
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



@interface JhtNewsViewController : JhtBaseViewController
#pragma mark - property
/** 代理 */
@property (nonatomic, assign) id<JhtNewsViewControllerDelegate> delegate;

/** 上级页面传过来的titleName */
@property (nonatomic, copy) NSString *titleName;



#pragma mark - Method
/** 暴露给外边的刷新方法 */
- (void)ghHeaderRefresh;


@end
