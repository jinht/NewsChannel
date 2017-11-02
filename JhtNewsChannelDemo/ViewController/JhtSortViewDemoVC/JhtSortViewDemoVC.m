//
//  JhtSortViewDemoVC.m
//  JhtNewsChannelDemo
//
//  GitHub主页: https://github.com/jinht
//  CSDN博客: http://blog.csdn.net/anticipate91
//
//  Created by Jht on 2017/7/30.
//  Copyright © 2017年 JhtNewsChannelDemo. All rights reserved.
//

#import "JhtSortViewDemoVC.h"
#import <JhtNewsChannel/JhtNewsChannel_Define.h>
#import <JhtNewsChannel/JhtNewsChannelItemModel.h>
#import <JhtNewsChannel/JhtNewsChannelItemEditView.h>
#import <JhtNewsChannel/JhtNewsChannelItemEditParamModel.h>

@interface JhtSortViewDemoVC () {
    // 滑动的当前页
    NSInteger _currentPageIndex;
}

/** 用于排序界面参数model */
@property (nonatomic, strong) JhtNewsChannelItemEditParamModel *itemEditModel;
/** 频道数组 */
@property (nonatomic, strong) NSMutableArray *channelArray;
/** 装有ChannelModel 待添加的数组 */
@property (nonatomic, strong) NSMutableArray<JhtNewsChannelItemModel> *toAddItemArray;
/** 不能移动的名字数组 */
@property (nonatomic, strong) NSMutableArray *notMoveNameArray;
/** 频道栏尾部的Btn */
@property (nonatomic, strong) UIButton *channelBarTailBtn;

/** 排序界面View */
@property (nonatomic, strong) UIView *sortView;
/** 选中的index */
//@property (nonatomic, assign) NSInteger currentPageIndex;

@end


@implementation JhtSortViewDemoVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _currentPageIndex = 0;
    
    // 导航栏设置
    [self svdvSetNav];
    
    // 显示排序界面
    [self svdvShowSortView];
}



#pragma mark - Nav
/** 导航栏设置 */
- (void)svdvSetNav {
    self.navigationController.navigationBar.translucent = NO;
    
    [self createNavigationBarTitleViewWithLabelTitle:@"JhtNewsChannel"];
}



#pragma mark - SortView
/** 显示排序界面 */
- (void)svdvShowSortView {
    JhtNewsChannelItemModel *model = self.channelArray[_currentPageIndex];
    __weak typeof(self) weakSelf = self;
    self.sortView = [[JhtNewsChannelItemEditView alloc] initWithTopBarItemArray:self.channelArray withToAddItemArray:self.toAddItemArray withSelectedName:model.titleName withNotMoveNameArray:self.notMoveNameArray isExistDeleteBtn:self.itemEditModel.isExistDelete withNewsChannelItemEditModel:self.itemEditModel withSortBlock:^(NSArray *modelArr, NSArray *nameArray, NSInteger selectIndex, NSArray *toAddNewModelArr) {
        NSLog(@"modelArr ==> %@", modelArr);
        NSLog(@"toAddNewModelArr ==> %@", toAddNewModelArr);
        NSLog(@"selectIndex ==> %ld", selectIndex);
        weakSelf.channelArray = [[NSMutableArray alloc] initWithArray:modelArr];
        // 排序完成，待添加的数组 改变了
        weakSelf.toAddItemArray = [[NSMutableArray alloc] initWithArray:toAddNewModelArr];
        _currentPageIndex = selectIndex;
    } withNoticeBlock:^{
    }];
    // 添加 view
    [self.navigationController.view addSubview:self.sortView];
    
    // 顶部排序删除部分高度
    CGFloat nceTopPartHeight = self.itemEditModel.distanceItemModel.itemEditTopPartHeight;
    // 顶部透明部分
    CGFloat nceTransparentHeight = self.itemEditModel.distanceItemModel.itemEditTransparentHeight;
    // 修改加号的坐标
    CGRect frame = self.channelBarTailBtn.frame;
    frame.origin.y += nceTransparentHeight;
    self.channelBarTailBtn.frame = frame;
    [self.sortView addSubview:self.channelBarTailBtn];
    
    // frame
    self.sortView.frame = CGRectMake(0, 0, FrameW, FrameH);
    JhtNewsChannelItemEditView *changeSortView = (JhtNewsChannelItemEditView *)self.sortView;
    changeSortView.sortBigScrollView.frame = CGRectMake(0, nceTopPartHeight + nceTransparentHeight, FrameW, FrameH - nceTransparentHeight - nceTopPartHeight);
}



#pragma mark - Get
/** 用于排序界面参数model */
- (JhtNewsChannelItemEditParamModel *)itemEditModel {
    if (!_itemEditModel) {
        _itemEditModel = [[JhtNewsChannelItemEditParamModel alloc] init];
        // 是否存在删除（排序删除，或者只有排序没有删除）
        _itemEditModel.isExistDelete = YES;
        
        // 用于排序界面中 背景颜色 等相关设置参数model
        JhtNewsChannelItemEditBackgroundColorModel *backgroundColorItemModel = [[JhtNewsChannelItemEditBackgroundColorModel alloc] init];
        // 用于排序界面中 文字颜色 等相关设置参数model
        JhtNewsChannelItemEditTextColorModel *textColorItemModel = [[JhtNewsChannelItemEditTextColorModel alloc] init];
        // 用于排序界面中 距离，高宽 等相关设置参数model
        JhtNewsChannelItemEditDistanceModel *distanceItemModel = [[JhtNewsChannelItemEditDistanceModel alloc] init];
        // 用于排序界面中 文字 等相关设置参数model
        JhtNewsChannelItemEditTextModel *textTitleItemModel = [[JhtNewsChannelItemEditTextModel alloc] init];
        
        // 排序界面总高度
        distanceItemModel.itemEditTotalHeight = FrameH;
        // 顶部排序删除部分高度
        distanceItemModel.itemEditTopPartHeight = 90 / 2.0;
        // 中间已选部分和未选部分中间view 高度
        distanceItemModel.itemEditAddTipViewPartHeight = 60 / 2.0;
        // ** 单独使用《JhtNewsChannelItemEditView》时 必要参数 **
        distanceItemModel.itemEditTransparentHeight = ([[UIApplication sharedApplication] statusBarFrame].size.height + 44);
        // 每个频道的 宽度
        distanceItemModel.itemEditChannelItemW = 78;
        // 每个频道的 高度
        distanceItemModel.itemEditChannelItemH = 32;
        // 频道间 纵向间距
        distanceItemModel.itemEditChannelMarginH = 15;
        // 每行的 频道个数
        distanceItemModel.itemEditRowChannelItemNum = 4;
        // 频道按钮的弧度
        distanceItemModel.itemEditChannelBtnCornerRadius = 32 / 2.0;
        
        // 每一个频道 边框颜色（最好与删除按钮颜色相同）
        textColorItemModel.itemBtnBorderColor = [UIColor colorWithRed:0.64f green:0.64f blue:0.64f alpha:1.00f];
        // 排序顶部删除完成按钮 的 borderColor 颜色
        textColorItemModel.itemEditConfirmButtonBorderColor = [UIColor redColor];
        // 排序顶部删除完成按钮 的 文字颜色 颜色
        textColorItemModel.itemEditConfirmButtonTitleColor = [UIColor redColor];
        // 排序 栏目切换 文字颜色
        textColorItemModel.itemEditTipsLabelTextColor = [UIColor blackColor];
        // 排序 界面中 点击添加更多栏目 文字颜色
        textColorItemModel.itemEditAddTipViewTextColor = [UIColor colorWithRed:0.07f green:0.07f blue:0.07f alpha:1.00f];
        // 选中频道Btn title的颜色
        textColorItemModel.itemEditChannelBtnSelectedBtnTitleColor = [UIColor redColor];
        // 未选中频道Btn title的颜色
        textColorItemModel.itemEditChannelBtnNormalBtnTitleColor = [UIColor grayColor];
        
        // 频道栏编辑 背景颜色（整体背景）
        backgroundColorItemModel.itemEditBackgroundColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:0.96];
        // 频道栏 顶部栏目的背景
        backgroundColorItemModel.itemEditTopPartBackgroundColor = [UIColor whiteColor];
        // 每一个占位背景的颜色
        backgroundColorItemModel.itemEditPlaceholderViewBgColor = [UIColor colorWithRed:0.96f green:0.93f blue:0.91f alpha:1.00f];
        // 已选 和 未选 中间标签的 背景颜色
        backgroundColorItemModel.itemMiddleBackgroundColor = [UIColor colorWithRed:0.93f green:0.95f blue:0.96f alpha:1.00f];
        
        // 频道栏编辑的时候删除最后一个频道时候的提示语
        textTitleItemModel.itemEditDeleteLastChannelItemHint = @"就一个了，你别给我删除了啊，好歹留一个啊！😜";
        // 已选 和 未选 中间标签的 文字
        textTitleItemModel.itemMiddleText = @"点击添加更多栏目";
        // 排序界面 顶部排序 左上角标题
        textTitleItemModel.itemTopTitleText = @"栏目切换";
        // 排序界面 右上角 完成 文字
        textTitleItemModel.itemSortCompletedText = @"完成";
        // 排序界面 不存在频道删除功能时 频道栏右上角 显示的 文字
        textTitleItemModel.itemSortNotExistDeleteText = @"拖拽排序";
        // 排序界面 存在频道删除功能时 频道栏右上角 显示的 文字
        textTitleItemModel.itemSortIsExistDeleteText = @"排序删除";
        _itemEditModel.backgroundColorItemModel = backgroundColorItemModel;
        _itemEditModel.textColorItemModel = textColorItemModel;
        _itemEditModel.distanceItemModel = distanceItemModel;
        _itemEditModel.textTitleItemModel = textTitleItemModel;
        
    }
    return _itemEditModel;
}

/** 频道数组，这里用get方法获取假数据，实际应用从网络获取直接赋值即可 */
- (NSMutableArray *)channelArray {
    if (!_channelArray) {
        _channelArray = [[NSMutableArray alloc] init];
        for (NSInteger i = 0; i < 15; i ++) {
            JhtNewsChannelItemModel *model = [[JhtNewsChannelItemModel alloc] init];
            model.titleName = [NSString stringWithFormat:@"NO.%ld", i + 1];
            // 模拟添加频道小红点
            if (i % 3) {
                model.isShowRedPoint = YES;
            } else {
                model.isShowRedPoint = NO;
            }
            if (i == 1) {
                model.titleName = [NSString stringWithFormat:@"这是特殊情况"];
            }
            if (i == 2) {
                model.titleName = [NSString stringWithFormat:@"这是五个字"];
            }
            [_channelArray addObject:model];
        }
    }
    return _channelArray;
}

/** 待添加的数组 这里用get方法获取假数据，实际应用从网络获取直接赋值即可 */
- (NSMutableArray *)toAddItemArray {
    if (!_toAddItemArray) {
        _toAddItemArray = [NSMutableArray array];
        
        // 待添加的数组
        for (NSInteger i = 0; i < 5; i ++) {
            JhtNewsChannelItemModel *model2 = [[JhtNewsChannelItemModel alloc] init];
            model2.titleName = [NSString stringWithFormat:@"New.%ld", i + 1];
            [_toAddItemArray addObject:model2];
        }
    }
    return _toAddItemArray;
}

/** 不能移动的名字数组 */
- (NSMutableArray *)notMoveNameArray {
    if (!_notMoveNameArray) {
        _notMoveNameArray = [[NSMutableArray alloc] initWithArray: @[@"NO.15", @"这是特殊情况"]];
    }
    return _notMoveNameArray;
}

/** 频道栏尾部的Btn */
- (UIButton *)channelBarTailBtn {
    if (!_channelBarTailBtn) {
        _channelBarTailBtn = [[UIButton alloc] initWithFrame:CGRectMake(FrameW - 45, 8, 40, 30)];
        _channelBarTailBtn.titleLabel.font = [UIFont systemFontOfSize:12];
        [_channelBarTailBtn setTitle:@"OK" forState:UIControlStateNormal];
        [_channelBarTailBtn setBackgroundColor:[UIColor redColor]];
        _channelBarTailBtn.layer.cornerRadius = 5;
        
        [_channelBarTailBtn addTarget:self action:@selector(svdvChannelTailBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _channelBarTailBtn;
}


#pragma mark Get Method
/** 频道栏尾部的Btn触发事件 */
-(void)svdvChannelTailBtnClick:(UIButton *)btn {
    // 返回的时候调用
    [(JhtNewsChannelItemEditView *)self.sortView packUpSelf];
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
