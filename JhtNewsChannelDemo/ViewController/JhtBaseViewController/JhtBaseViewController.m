//
//  JhtBaseViewController.m
//  JhtNewsChannelDemo
//
//  Created by Jht on 16/8/12.
//  Copyright © 2016年 JhtNewsChannelDemo. All rights reserved.
//

#import "JhtBaseViewController.h"

@interface JhtBaseViewController ()

@end


@implementation JhtBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
}



#pragma mark - Navigation
/** 设置导航栏下边蓝色的线 */
- (void)createNavigationBarLowLine {
    UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(0, self.navigationController.navigationBar.frame.size.height - 1, FrameW, 2)];
    lineView.backgroundColor = UIColorFromRGB(0x61CBF5);
    [self.navigationController.navigationBar addSubview:lineView];
}

/** 创建导航栏左侧自定义的返回按钮 */
- (void)createNavigationBarLeftBtn {
    // 图片
    UIImageView *img = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"nav-back"]];
    img.frame = CGRectMake(0, 0, img.frame.size.width, img.frame.size.height);
    UILabel *lable = [[UILabel alloc] init];
    lable.textColor = [UIColor grayColor];
    lable.font = [UIFont boldSystemFontOfSize:18];
//    lable.text = @"返回";
    [lable sizeToFit];
    lable.frame = CGRectMake(img.frame.origin.x + img.frame.size.width + 5, img.frame.origin.y - 2, lable.frame.size.width + 20, lable.frame.size.height);
    
//    UIView *backView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, img.frame.size.width+lable.frame.size.width, img.frame.size.height)];
//    [backView addSubview:lable];
    
    UIButton *backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    backButton.frame = CGRectMake(0, 0, img.frame.size.width + lable.frame.size.width, img.frame.size.height);
    backButton.imageEdgeInsets = UIEdgeInsetsMake(0, -lable.frame.size.width, 0, 0);
    [backButton setImage:[UIImage imageNamed:@"nav-back"] forState:UIControlStateNormal];
    [backButton setImage:[UIImage imageNamed:@"nav-back-press"] forState:UIControlStateHighlighted];
    
//    backButton.frame = backView.bounds;
//    [backView addSubview:backButton];
    [backButton addSubview:lable];
    [backButton addTarget:self action:@selector(popToFormerController) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithCustomView:backButton];
    self.navigationItem.leftBarButtonItem = item;
}
/** 默认导航栏左侧返回按钮触发事件(子类可以重写) */
- (void)popToFormerController {
    [self.navigationController popViewControllerAnimated:YES];
}

/** 创建Navigationbar的TitleView */
- (void)createNavigationBarTitleViewWithLabelTitle:(NSString *)title {
    UILabel *navigationBarTitleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 44, 80)];
    navigationBarTitleLabel.text = title;
    navigationBarTitleLabel.font = [UIFont boldSystemFontOfSize:18];
    navigationBarTitleLabel.textAlignment = NSTextAlignmentCenter;
    navigationBarTitleLabel.textColor = [UIColor colorWithRed:0.30f green:0.77f blue:0.98f alpha:1.00f];
    self.navigationItem.titleView = navigationBarTitleLabel;
}

/** 创建导航栏右侧侧自定义的按钮(有图标) */
- (void)createNavigationBarRightBtnWithRightImage:(UIImage *)RImage WithRightLabelText:(NSString *)RLText {
    // 图标
    UIImageView *img = [[UIImageView alloc]initWithImage:RImage];
    img.frame = CGRectMake(0, 0, img.frame.size.width, img.frame.size.height);
    // 显示字的label
    UILabel *lable = [[UILabel alloc] init];
    lable.textColor = [UIColor colorWithRed:0.49f green:0.49f blue:0.49f alpha:1.00f];
    lable.font = [UIFont systemFontOfSize:15];
    lable.text = RLText;
    [lable sizeToFit];
    lable.frame = CGRectMake(img.frame.origin.x + img.frame.size.width + 4, img.frame.origin.y - 2, lable.frame.size.width, lable.frame.size.height);
    
    // 承接两个控件的背景
    UIView *backView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, img.frame.size.width + lable.frame.size.width + 5, img.frame.size.height)];
    [backView addSubview:img];
    [backView addSubview:lable];
    UITapGestureRecognizer *rightItemTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(rightItemTapGes:)];
    [backView addGestureRecognizer:rightItemTap];
    
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithCustomView:backView];
    self.navigationItem.rightBarButtonItem = item;
}
/** 默认导航栏右侧按钮点击触发事件(有图标~子类可以重写) */
- (void)rightItemTapGes:(UITapGestureRecognizer *)ges {
    NSLog(@"导航栏右侧按钮被点击");
}

/** 创建导航栏右侧侧自定义的按钮(无图标) */
- (void)createNavigationBarRightBtnWithLabelText:(NSString *)RLText {
    UILabel *lable = [[UILabel alloc] init];
    lable.textColor = [UIColor colorWithRed:0.49f green:0.49f blue:0.49f alpha:1.00f];
    lable.userInteractionEnabled = YES;
    lable.font = [UIFont systemFontOfSize:16];
    lable.text = RLText;
    [lable sizeToFit];
    
    // 添加手势
    UITapGestureRecognizer *rightItemTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(rightItemNoImageTapGes:)];
    [lable addGestureRecognizer:rightItemTap];
    
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithCustomView:lable];
    self.navigationItem.rightBarButtonItem = item;
}
/** 默认导航栏右侧按钮点击触发事件(无图标~子类可以重写) */
- (void)rightItemNoImageTapGes:(UITapGestureRecognizer *)ges {
    NSLog(@"导航栏右侧按钮被点击");
}















- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
