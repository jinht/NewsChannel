# NewsChannel

## Contents
#### 新闻频道栏（网易新闻，新浪新闻，搜狐新闻，今日头条，聚划算，腾讯视频，优酷等类似的频道栏）<br>
#### 支持懒加载 &amp;&amp; 缓存 &amp;&amp; 排序 &amp;&amp; 增删等。<br>

### 一言不合就上效果图
1. JhtNewsChannelItemModel:顶部频道Model,开发者可以继承这个model，来扩展满足自己需求的model;
2. 1. JhtChannelBarAndSlideViewConnectParamModel: 用于频道栏字号，字间距，颜色，缓存页数等等的设置的参数model。 注意:  channelArray:频道数组这个属性，是用于存储JhtNewsChannelItemModel的数组;
3. JhtNewsChannelItemEditParamModel: 用于排序界面中相关设置参数model;
4. 建立滑频道条和可滑动的view;
```oc
/** 创建BarAndSliderView
 *  barAndSlideModel：用于设置sliderView和bar参数model
 *  itemEditModel：用于排序界面的参数设置
 *  delegate：代理
 *  baseViewController：所处于的VC
 *  sortFView：排序界面放入的父view
 *  titleArray：所有的名字数组
 */
- (id)initSlideViewBarAndSlideModelWithModel:(JhtChannelBarAndSlideViewConnectParamModel *)barAndSlideModel withNewsChannelItemEditModel:(JhtNewsChannelItemEditParamModel *)itemEditModel withDelegte:(id<JhtTotalSlideViewDelegate>)delegate withBaseViewController:(id)baseViewController withSortFView:(UIView *)sortFView withTitleArray:(NSArray *)titleArray;
```oc

5.需要实现的JhtTotalSlideViewDelegate代理方法：
```oc
@protocol JhtTotalSlideViewDelegate <NSObject>
/** VC总数量 */
- (NSInteger)numberOfTabsInJhtTotalSlideView:(JhtTotalSlideView *)sender;
/** 当前index下的VC */
- (UIViewController *)JhtTotalSlideView:(JhtTotalSlideView *)sender controllerAt:(NSInteger)index;

@optional
/** 点击VC的index */
- (void)JhtTotalSlideView:(JhtTotalSlideView *)sender didSelectedAt:(NSInteger)index;

/** 排序之后的操作
 *  modelArr：model数组
 *  nameArray：名字数组
 *  selectedIndex：选中的index
 */
- (void)JhtTotalSlideViewWithSortModelArr:(NSArray *)modelArr withNameArray:(NSArray *)nameArray withSelectIndex:(NSInteger)selectedIndex;
```oc
       
###Remind
* ARC
* iOS >= 7.0
* iPhone \ iPad 
       
## Hope
* If you find bug when used，Hope you can Issues me，Thank you or try to download the latest code of this framework to see the BUG has been fixed or not
* If you find the function is not enough when used，Hope you can Issues me，I very much to add more useful function to this framework ，Thank you !
