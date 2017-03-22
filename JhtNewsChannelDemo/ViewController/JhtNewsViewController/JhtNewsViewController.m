//
//  JhtNewsViewController.m
//  JhtNewsChannelDemo
//
//  GitHub主页: https://github.com/jinht
//  CSDN博客: http://blog.csdn.net/anticipate91
//
//  Created by Jht on 16/8/12.
//  Copyright © 2016年 JhtNewsChannelDemo. All rights reserved.
//

#import "JhtNewsViewController.h"

@interface JhtNewsViewController() <UITableViewDelegate, UITableViewDataSource> {
    UITableView *_tableView;
}

@end


@implementation JhtNewsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(100, 100, 150, 150)];
    label.center = CGPointMake(self.view.center.x, self.view.center.y - 64 / 2.0 - 45 / 2.0);
    label.backgroundColor = [UIColor whiteColor];
    label.text = [NSString stringWithFormat:@"%@", self.titleName];
    label.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:label];
    // 设置背景颜色
    [self newsSetBackgroundColor];
    
    /** _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.bounds), CGRectGetHeight(self.view.bounds) - 109) style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.backgroundColor = [UIColor redColor];
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];*/
}

/** 设置背景颜色 */
- (void)newsSetBackgroundColor {
    NSArray *colArr = @[[UIColor redColor], [UIColor greenColor], [UIColor magentaColor], [UIColor cyanColor], [UIColor grayColor], [UIColor yellowColor], [UIColor orangeColor], [UIColor purpleColor]];
    self.view.backgroundColor = colArr[arc4random()%(colArr.count - 1)];
}



#pragma mark - Public Method
/** 暴露给外边的刷新方法 */
- (void)headerRefresh {
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"处于选中状态，就是模拟刷新了哈，玩的愉快！" message:@"" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
    alert.tag = 111;
    [alert show];
}



#pragma mark - UIAlertViewDelegate
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    if (alertView.tag == 111) {
        if (buttonIndex == 0) {
            // 刷新成功，隐藏大框顶部的小红点
            if ([self.delegate respondsToSelector:@selector(refreshOver:)]) {
                [self.delegate refreshOver:self];
            }
        }
    }
}



#pragma mark - UITableViewDelegate
/** - (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"这是第 %ld 条数据", indexPath.row];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 40;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSInteger index = indexPath.row;
    NSLog(@"点击了%ld", index);
} */



#pragma mark - dealloc
- (void)dealloc {
    NSLog(@"ooo");
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
