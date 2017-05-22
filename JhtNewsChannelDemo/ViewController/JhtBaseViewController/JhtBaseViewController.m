//
//  JhtBaseViewController.m
//  JhtTools
//
//  GitHub主页: https://github.com/jinht
//  CSDN博客: http://blog.csdn.net/anticipate91
//
//  Created by Jht on 16/8/12.
//  Copyright © 2016年 JhtTools. All rights reserved.
//

#import "JhtBaseViewController.h"

@interface JhtBaseViewController ()

@end


@implementation JhtBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
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
