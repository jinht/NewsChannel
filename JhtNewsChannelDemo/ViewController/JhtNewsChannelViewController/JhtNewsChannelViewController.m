//
//  JhtNewsChannelViewController.m
//  JhtNewsChannelDemo
//
//  GitHub主页: https://github.com/jinht
//  CSDN博客: http://blog.csdn.net/anticipate91
//
//  Created by Jht on 16/8/12.
//  Copyright © 2016年 JhtNewsChannelDemo. All rights reserved.
//

#import "JhtNewsChannelViewController.h"
#import "JhtNewsChannelSDK.h"
#import "JhtNewsViewController.h"

/** 顶部滑动的条高度 */
#define KTopSCHeight (90 / 2)
/** 顶部滑动的条宽度*/
#define KTopSCWidth (FrameW - 40)

@interface JhtNewsChannelViewController () <JhtTotalSlideViewDelegate, JhtNewsViewControllerDelegate> {
    // 滑动的当前页
    NSInteger _currentPageIndex;
    
    // 界面是否正在刷新
    BOOL _isRefreshing;
}
/** 大框 */
@property (nonatomic, strong) JhtChannelBarAndSlideViewConnect *slideView;

/** JhtChannelBarAndSlideViewConnect_参数model */
@property (nonatomic, strong)JhtChannelBarAndSlideViewConnectParamModel *barAndSlideModel;
/** 用于排序界面参数model */
@property (nonatomic, strong) JhtNewsChannelItemEditParamModel *itemEditModel;

/** 频道数组 */
@property (nonatomic, strong) NSMutableArray *channelArray;
/** 装有ChannelModel 待添加的数组 */
@property (nonatomic, strong) NSMutableArray<JhtNewsChannelItemModel> *toAddItemArray;

@end


@implementation JhtNewsChannelViewController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    // 隐藏导航栏
//    [self.navigationController setNavigationBarHidden:YES animated:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:0.95f green:0.86f blue:0.79f alpha:1.00f];
    
    // 导航栏设置
    [self ncSetNav];
    
    // 初始化
    _currentPageIndex = 0;
    // 建立导航条
    [self ncCreateTopScrollView];
}



#pragma mark - 导航栏设置
/** 导航栏设置 */
- (void)ncSetNav {
    self.navigationController.navigationBar.translucent = NO;
    
    [self createNavigationBarTitleViewWithLabelTitle:@"JhtNewsChannel"];
}



#pragma mark - 顶部频道条部分
/** 建立滑动条 */
- (void)ncCreateTopScrollView {
    if (_slideView) {
        [_slideView removeFromSuperview];
    }
    
    _slideView = [[[JhtChannelBarAndSlideViewConnect alloc] init] initSlideViewAndItemEditViewWithBarAndSlideModel:self.barAndSlideModel withNewsChannelItemEditModel:self.itemEditModel withIsExistNavOrTab:NT_OnlyHave_N withChanelArray:self.channelArray withBaseViewController:self withDelegte:self];
    
    // 只适用于NT_OnlyHave_T || NT_None 两种形式（即不存在navigationBar），default = 20.0
//    _slideView.connectToTopSpace = 30;
    
    [self.view addSubview:self.slideView];
}



#pragma mark - Get
/** 用于排序界面参数model */
- (JhtNewsChannelItemEditParamModel *)itemEditModel {
    if (!_itemEditModel) {
        _itemEditModel = [[JhtNewsChannelItemEditParamModel alloc] init];
        // 是否存在删除（排序删除，或者只有排序没有删除）
        _itemEditModel.isExistDelete = YES;
        
        
        /*
         *   以下内容为个性配置，可根据需求进行配置
         *
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
         */
    }
    return _itemEditModel;
}

/** JhtChannelBarAndSlideViewConnect_参数model */
- (JhtChannelBarAndSlideViewConnectParamModel *)barAndSlideModel {
    if (!_barAndSlideModel) {
        // 生成频道栏name数组
        NSMutableArray *channelNameArr = [[NSMutableArray alloc] init];
        for (NSInteger i = 0; i < self.channelArray.count; i ++) {
            JhtNewsChannelItemModel *model = self.channelArray[i];
            [channelNameArr addObject:model.titleName];
        }
        _barAndSlideModel = [[JhtChannelBarAndSlideViewConnectParamModel alloc] init];
        
        // 用于切换频道栏 尾部加号按钮 设置的参数model
        JhtChannelBarTailBtnModel *channelTailBtnModel = [[JhtChannelBarTailBtnModel alloc] init];
        _barAndSlideModel.channelTailBtnModel = channelTailBtnModel;
        
        // 是否添加频道栏尾部的加号Btn
        channelTailBtnModel.isAddTailBtn = YES;
        // 缓存总数
        _barAndSlideModel.cacheCount = [channelNameArr count] > 6 ? 6 : [channelNameArr count];
        // 装有ChannelModel 待添加的数组
        _barAndSlideModel.toAddItemArray = self.toAddItemArray;
        // 不能移动删除频道的名字数组
        _barAndSlideModel.notMoveNameArray = [[NSMutableArray alloc] initWithArray: @[@"NO.15", @"这是特殊情况"]];
        // 选中的索引值
        _barAndSlideModel.selectedIndex = _currentPageIndex;
        
        
        /*
         *   以下内容为个性配置，可根据需求进行配置
         *
        // 用于切换频道栏 颜色和坐标 设置的参数model
        JhtChannelBarColorAndFontModel *channelColorAndFontModel = [[JhtChannelBarColorAndFontModel alloc] init];
        _barAndSlideModel.channelColorAndFontModel = channelColorAndFontModel;
        // 用于切换频道栏 距离和坐标 设置的参数model
        JhtChannelBarAndSlideViewSpaceAndFrameModel *channelSpaceAndRectModel = [[JhtChannelBarAndSlideViewSpaceAndFrameModel alloc] init];
        _barAndSlideModel.channelSpaceAndRectModel = channelSpaceAndRectModel;
        
        // 顶部频道条的坐标
        channelSpaceAndRectModel.topBarFrame = CGRectMake(0, 0, KTopSCWidth, KTopSCHeight);
        
        // 整个topbar频道条两边空白距离
        channelSpaceAndRectModel.itemTopBarSpace = 0;
        // 小红点的宽度
        channelSpaceAndRectModel.itemRedWidth = 8;
        // 小红点和字之间的距离
        channelSpaceAndRectModel.itemLabelToRedSpace = 1;
        // 频道栏之间横向间距
        channelSpaceAndRectModel.itemSpace = 25 * WidthScale375;
        // 频道栏与VC之间的距离
        channelSpaceAndRectModel.channelBarBottomSpace = 0;
        
        // 频道颜色
        channelColorAndFontModel.itemNormalColor = UIColorFromRGB(0x666666);
        channelColorAndFontModel.itemSelectedColor = UIColorFromRGB(0x61cbf5);
        // 未选中的字号
        channelColorAndFontModel.itemNormalFont = [UIFont systemFontOfSize:14];
        // 选中的字号
        channelColorAndFontModel.itemSelectedFont = [UIFont systemFontOfSize:16];
        // 轨道颜色
        channelColorAndFontModel.trackColor = UIColorFromRGB(0x61cbf5);
        // 设置旋转的加号的图标，不设置就用默认的
        //    channelTailBtnModel.channelBarTailBtnAddImageViewImage = [UIImage imageNamed:@""];
        // 旋转加号的frame 可以设置也可以不设置，不设置就是默认的
        //    channelSpaceAndRectModel.channelBarTailBtnFrame = CGRectMake(KGHTopSCWidth, 0, FrameW - KGHTopSCWidth, KGHTopSCHeight);
        */
    }
    return _barAndSlideModel;
}

/** 频道数组， 这里用get方法获取假数据，实际应用从网络获取直接赋值即可 */
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
        _toAddItemArray = [[NSMutableArray alloc] init];
        
        // 待添加的数组
        for (NSInteger i = 0; i < 30; i ++) {
            JhtNewsChannelItemModel *model2 = [[JhtNewsChannelItemModel alloc] init];
            model2.titleName = [NSString stringWithFormat:@"New.%ld", i + 1];
            [_toAddItemArray addObject:model2];
        }
    }
    return _toAddItemArray;
}



#pragma mark - JhtTotalSlideViewDelegate
/** VC总数量 */
- (NSInteger)numberOfTabsInJhtTotalSlideView:(JhtTotalSlideView *)sender {
    return _channelArray.count;
}

/** 当前index下的VC */
- (UIViewController *)JhtTotalSlideView:(JhtTotalSlideView *)sender controllerAt:(NSInteger)index {
    JhtNewsChannelItemModel *model = _channelArray[index];
    JhtNewsViewController *newsVC = [[JhtNewsViewController alloc] init];
    newsVC.titleName = model.titleName;
    newsVC.delegate = self;
    return  newsVC;
}

/** VC总数量 */
- (void)JhtTotalSlideView:(JhtTotalSlideView *)sender didSelectedAt:(NSInteger)index {
    _currentPageIndex = index;
    NSString *key = [NSString stringWithFormat:@"%ld", (long)_currentPageIndex];
    JhtNewsChannelItemModel *model = _channelArray[index];
    id vc = [self.slideView.cache objectForKey:key];
    
    if ([vc isKindOfClass:[JhtNewsViewController class]] && model.isShowRedPoint) {
        JhtNewsViewController *news = vc;
        [news headerRefresh];
        _isRefreshing = YES;
    }
    if (_isRefreshing) {
        // 刷新的时候，尾巴按钮不可以被点击，刷新结束才允许排序界面出现
        [self.slideView judgeChannelBarTailBtnIsEnableClick:NO];
    } else {
        // 刷新结束才允许，尾巴按钮可以被点击，可以出现排序界面出现
        [self.slideView judgeChannelBarTailBtnIsEnableClick:YES];
    }
}

/** 排序之后的操作
 *  modelArr：JhtNewsChannelItemModel数组
 *  nameArray：频道名字数组
 *  selectedIndex：选中的index
 */
- (void)JhtTotalSlideViewWithSortModelArr:(NSArray *)modelArr withNameArray:(NSArray *)nameArray withSelectIndex:(NSInteger)selectedIndex {
    self.channelArray = [[NSMutableArray alloc] initWithArray:modelArr];
    _currentPageIndex = selectedIndex;
}



#pragma mark - JhtNewsViewControllerDelegate
/** 刷新结束后调用 */
- (void)refreshOver:(id)sender {
    // 让哪一页刷新了
    NSString *titleName = [(JhtNewsViewController *)sender titleName];
    // 隐藏小红点
    [self ncHiddenRedBadgeWithName:titleName isHidden:YES];
}

#pragma mark 根据名字找到数组
/** 根据名字找到数组*/
- (NSInteger)ncGetIndexWithName:(NSString *)titleName {
    for (NSInteger i = 0; i < self.channelArray.count; i ++) {
        JhtNewsChannelItemModel *model = self.channelArray[i];
        if ([model.titleName isEqualToString:titleName]) {
            return i;
        }
    }
    // 没有找到
    return -1;
}

#pragma mark 显示/隐藏小红点
/** 显示/隐藏小红点
 * isHidden：区分显示/隐藏
 */
- (void)ncHiddenRedBadgeWithName:(NSString *)titleName isHidden:(BOOL)isHidden {
    // 根据名字找到数组
    NSInteger index = [self ncGetIndexWithName:titleName];
    if (index >= 0) {
        JhtNewsChannelItemModel *model = self.channelArray[index];
        model.isShowRedPoint = !isHidden;
        // 隐藏或者出现小红点
        [self.slideView redPonitIsHidden:isHidden withIndex:index];
        self.slideView.channelArray = self.channelArray;
    }
    _isRefreshing = NO;
    // 刷新结束才允许，尾巴按钮可以被点击，可以出现排序界面出现
    [self.slideView judgeChannelBarTailBtnIsEnableClick:YES];
}



#pragma mark - Tools
/** 计算Label的高度 */
- (CGSize)ncGetCurrentLabelSizeWithContent:(NSString *)content WithTextFont:(UIFont *)font WithWidthSize:(CGSize)newSize {
    CGSize size;
    CGFloat version = [[[UIDevice currentDevice] systemVersion] floatValue];
    if (version >= 7.0) {
        NSDictionary *dic = [NSDictionary dictionaryWithObjectsAndKeys:font,NSFontAttributeName, nil];
        size = [content boundingRectWithSize:newSize options:NSStringDrawingTruncatesLastVisibleLine|NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading  attributes:dic context:nil].size;
    } else {
        size = [content sizeWithFont:font constrainedToSize:newSize lineBreakMode:NSLineBreakByCharWrapping];
    }
    return size;
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
