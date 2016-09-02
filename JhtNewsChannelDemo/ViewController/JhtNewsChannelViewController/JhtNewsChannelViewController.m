//
//  JhtNewsChannelViewController.m
//  JhtNewsChannelDemo
//
//  Created by Jht on 16/8/12.
//  Copyright © 2016年 JhtNewsChannelDemo. All rights reserved.
//

#import "JhtNewsChannelViewController.h"
#import "JhtNewsViewController.h"
#import "JhtNewsChannelItemModel.h"
#import "JhtChannelBarAndSlideViewConnect.h"

/** 顶部滑动的条高度 */
#define KTopSCHeight (90/2)
/** 顶部滑动的条宽度*/
#define KTopSCWidth (FrameW - 40)

@interface JhtNewsChannelViewController () <JhtTotalSlideViewDelegate, JhtNewsViewControllerDelegate> {
    // 滑动的当前页
    NSInteger _currentPageIndex;
    
    // 界面是否正在刷新;
    BOOL _isRefreshing;
}
/** 用于排序界面参数model */
@property (nonatomic, strong) JhtNewsChannelItemEditParamModel *itemEditModel;
/** 频道数组 */
@property (nonatomic, strong) NSMutableArray *channelArray;
/** 装有ChannelModel 待添加的数组 */
@property (nonatomic, strong) NSMutableArray *toAddItemArray;
/** 大框 */
@property (strong, nonatomic) JhtChannelBarAndSlideViewConnect *slideView;

@end


@implementation JhtNewsChannelViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:0.95f green:0.86f blue:0.79f alpha:1.00f];
    
    // 生成数据源
    [self ncCreateData];
    
    // 导航栏设置
    [self ncSetNav];
}



#pragma mark - 生成数据源
/** 生成数据源 */
- (void)ncCreateData {
    for (NSInteger i = 0; i < 15; i ++) {
        JhtNewsChannelItemModel *model = [[JhtNewsChannelItemModel alloc] init];
        model.titleName = [NSString stringWithFormat:@"NO.%ld", i + 1];
        // 模拟添加频道小红点
        if(i % 3) {
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
        [self.channelArray addObject:model];
    }
    // 待添加的数组
    for (NSInteger i = 0; i < 15; i ++) {
        JhtNewsChannelItemModel *model2 = [[JhtNewsChannelItemModel alloc] init];
        model2.titleName = [NSString stringWithFormat:@"New.%ld", i + 1];
        [self.toAddItemArray addObject:model2];
    }
    
    // 生成频道栏name数组
    NSMutableArray *channelNameArr = [[NSMutableArray alloc] init];
    for (NSInteger i = 0; i < self.channelArray.count; i ++) {
        JhtNewsChannelItemModel *model = self.channelArray[i];
        [channelNameArr addObject:model.titleName];
    }
    _currentPageIndex = 0;
    
    // 建立滑动条
    [self ncCreateTopScrollViewWithTitleArray:channelNameArr];
}



#pragma mark - 导航栏设置
/** 导航栏设置 */
- (void)ncSetNav {
    self.navigationController.navigationBar.translucent = NO;
    [self createNavigationBarTitleViewWithLabelTitle:@"JhtNewsChannel"];
}



#pragma mark - 顶部频道条部分
/** 建立滑动条 */
- (void)ncCreateTopScrollViewWithTitleArray:(NSArray *)titleArray {
    if (_slideView) {
        [_slideView removeFromSuperview];
    }
    JhtChannelBarAndSlideViewConnectParamModel *barAndSlideModel = [self createBarAndSliderModel:titleArray];
    _slideView = [[[JhtChannelBarAndSlideViewConnect alloc] init] initSlideViewAndItemEditViewWithBarAndSlideModel:barAndSlideModel withNewsChannelItemEditModel:self.itemEditModel withChanelArray:self.channelArray withBaseViewController:self withSortFView:self.navigationController.view withTitleArray:titleArray withDelegte:self];
    [self.view addSubview:self.slideView];
}

/** 生成参数model */
- (JhtChannelBarAndSlideViewConnectParamModel *)createBarAndSliderModel:(NSArray *)titleArray {
    JhtChannelBarAndSlideViewConnectParamModel *barAndSliderModel = [[JhtChannelBarAndSlideViewConnectParamModel alloc] init];
    // sliderView的坐标
    barAndSliderModel.sliderFrame = CGRectMake(0, 0, FrameW, FrameH - KTopHeight);
    // 顶部频道条的坐标
    barAndSliderModel.topBarFrame = CGRectMake(0, 0, KTopSCWidth, KTopSCHeight);
    // 缓存总数
    barAndSliderModel.cacheCount = [titleArray count] > 6 ? 6 : [titleArray count];
    barAndSliderModel.itemNormalColor = UIColorFromRGB(0x666666);
    barAndSliderModel.itemSelectedColor = UIColorFromRGB(0x61cbf5);
    // 未选中的 字号
    barAndSliderModel.itemNormalFont = [UIFont systemFontOfSize:14];
    // 选中的字号
    barAndSliderModel.itemSelectedFont = [UIFont systemFontOfSize:16];
    // 轨道颜色
    barAndSliderModel.trackColor = UIColorFromRGB(0x61cbf5);
    // 整个topbar频道条两边空白距离
    barAndSliderModel.itemTopBarSpace = 0;
    // 小红点的宽度
    barAndSliderModel.itemRedWidth = 8;
    // 小红点和字之间的距离
    barAndSliderModel.itemLabelToRedSpace = 1;
    // 频道栏之间横向间距
    barAndSliderModel.itemSpace = 25*WidthScale375;
    // 频道栏与VC之间的距离
    barAndSliderModel.channelBarBottomSpace = 0;
    // 是否有添加按钮，
    barAndSliderModel.isAddTailBtn = YES;
    // 不能移动的名字数组
    barAndSliderModel.notMoveNameArray = [[NSMutableArray alloc] initWithArray: @[@"NO.9", @"NO.6"]];
    // 是否存在删除（排序删除， 或者只有排序没有删除）
    barAndSliderModel.isExistDelete = YES;
    
    // 可以设置也可以不设置，不设置就是默认的
//    barAndSliderModel.frame = CGRectMake(KGHTopSCWidth, 0, FrameW - KGHTopSCWidth, KGHTopSCHeight);
    // 设置旋转的加号的图标，不设置就用默认的
//    barAndSliderModel.addImageView.image = addImage;
    // 装有ChannelModel 待添加的数组
    barAndSliderModel.toAddItemArray = self.toAddItemArray;
    // 选中的索引值
    barAndSliderModel.selectedIndex = _currentPageIndex;
    return barAndSliderModel;
}



#pragma mark - Get
/** 用于排序界面参数model */
- (JhtNewsChannelItemEditParamModel *)itemEditModel {
    if (!_itemEditModel) {
        _itemEditModel = [[JhtNewsChannelItemEditParamModel alloc] init];
        /** 顶部排序删除部分高度 */
        _itemEditModel.itemEditTopPartHeight = 90/2;
        /** 中间已选部分和未选部分中间view 高度 */
        _itemEditModel.itemEditAddTipViewPartHeight = 60/2;
        
        /** 排序顶部删除完成按钮 的 borderColor 颜色*/
        _itemEditModel.itemEditConfirmButtonBorderColor = [UIColor redColor];
        /** 排序顶部删除完成按钮 的 文字颜色 颜色 */
        _itemEditModel.itemEditConfirmButtonTitleColor = [UIColor redColor];
        /** 排序栏目切换 文字颜色*/
        _itemEditModel.itemEditTipsLabelTextColor = [UIColor blackColor];
        /** 排序 界面中 点击添加更多栏目 文字颜色 */
        _itemEditModel.itemEditAddTipViewTextColor = [UIColor colorWithRed:0.07f green:0.07f blue:0.07f alpha:1.00f];
        
        /** 每个频道的 宽度 */
        _itemEditModel.itemEditChannelItemW = 78;
        /** 每个频道的 高度 */
        _itemEditModel.itemEditChannelItemH = 32;
        
        /** 频道间 纵向间距 */
        _itemEditModel.itemEditChannelMarginH = 15;
        /** 每行的 频道个数 */
       _itemEditModel.itemEditRowChannelItemNum = 4;
        
        /** 选中频道Btn title的颜色 */
       _itemEditModel.itemEditChannelBtnSelectedBtnTitleColor = [UIColor redColor];
        /** 未选中频道Btn title的颜色 */
       _itemEditModel.itemEditChannelBtnNormalBtnTitleColor = [UIColor grayColor];
        /** 每一个占位背景的颜色 */
        _itemEditModel.itemEditPlaceholderViewBgColor = [UIColor colorWithRed:0.96f green:0.93f blue:0.91f alpha:1.00f];
        /** 频道按钮的弧度 */
       _itemEditModel.itemEditChannelBtnCornerRadius = 32/2;
        /** 频道栏编辑的时候删除最后一个频道时候的提示语 */
        _itemEditModel.itemEditDeleteLastChannelItemHint = @"就一个了，你别给我删除了啊，好歹留一个啊！😜";
    }
    return _itemEditModel;
}

/** 频道数组 */
- (NSArray *)channelArray {
    if (!_channelArray) {
        _channelArray = [[NSMutableArray alloc] init];
    }
    return _channelArray;
}

/** 待添加的数组 */
- (NSMutableArray *)toAddItemArray {
    if (!_toAddItemArray) {
        _toAddItemArray = [[NSMutableArray alloc] init];
    }
    return _toAddItemArray;
}



#pragma mark - JhtTotalSlideViewDelegate
- (NSInteger)numberOfTabsInJhtTotalSlideView:(JhtTotalSlideView *)sender {
    return _channelArray.count;
}

- (UIViewController *)JhtTotalSlideView:(JhtTotalSlideView *)sender controllerAt:(NSInteger)index {
    JhtNewsChannelItemModel *model = _channelArray[index];
    JhtNewsViewController *newsVC = [[JhtNewsViewController alloc] init];
    newsVC.titleName = model.titleName;
    newsVC.delegate = self;
    return  newsVC;
}

- (void)JhtTotalSlideView:(JhtTotalSlideView *)sender didSelectedAt:(NSInteger)index {
    NSLog(@"current:%ld", (long)index);
    _currentPageIndex = index;
    NSString *key = [NSString stringWithFormat:@"%ld", (long)_currentPageIndex];
    JhtNewsChannelItemModel *model = _channelArray[index];
    id vc = [self.slideView.cache objectForKey:key];
    
    NSLog(@"选中了：%@",model.titleName);
    if ([vc isKindOfClass:[JhtNewsViewController class]] && model.isShowRedPoint) {
        JhtNewsViewController *gh = vc;
        [gh ghHeaderRefresh];
        _isRefreshing = YES;
    }
    if (_isRefreshing) {
        // 刷新的时候，尾巴按钮不可以被点击，刷新结束才允许排序界面出现
        [self.slideView judgeChannelBarTailBtnIsEnableClick:NO];
    } else {
        // 刷新结束才允许，尾巴按钮可以被点击 ,可以出现排序界面出现
        [self.slideView judgeChannelBarTailBtnIsEnableClick:YES];
    }
}

/** 排序之后的操作
 *  modelArr：model数组
 *  nameArray：名字数组
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
    // 刷新结束才允许，尾巴按钮可以被点击 ,可以出现排序界面出现
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
