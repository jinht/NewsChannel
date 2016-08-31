# NewsChannel

## Contents
#### 新闻频道栏（网易新闻，新浪新闻，搜狐新闻，今日头条，聚划算，腾讯视频，优酷等类似的频道栏）<br>
#### 支持小红点标识 &amp;&amp; 懒加载 &amp;&amp; 缓存 &amp;&amp; 排序 &amp;&amp; 增删等。<br><br>

### 一言不合就上效果图
<img src="https://raw.githubusercontent.com/jinht/NewsChannel/master/ReadMEImages/Gif/slide.gif"  width=250 height=445 />
&emsp;&emsp;<img src="https://raw.githubusercontent.com/jinht/NewsChannel/master/ReadMEImages/Gif/shake.gif"  width=250 height=445 />
&emsp;&emsp;<img src="https://raw.githubusercontent.com/jinht/NewsChannel/master/ReadMEImages/Gif/deleteAndAdd.gif"  width=250 height=445 />
&emsp;&emsp;<img src="https://raw.githubusercontent.com/jinht/NewsChannel/master/ReadMEImages/Gif/redPoint.gif"  width=250 height=445 /><br>

### How to use
1. JhtNewsChannelItemModel:顶部频道Model,开发者可以继承这个model，来扩展满足自己需求的model;
2. JhtChannelBarAndSlideViewConnectParamModel: 用于频道栏字号，字间距，颜色，缓存页数等等的设置的参数model。 注意:  channelArray:频道数组这个属性，是用于存储JhtNewsChannelItemModel的数组;
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
```
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
```
6.JhtChannelBarAndSlideViewConnect中<br>
a. 判断频道栏尾部加号按钮是否可以被点击
```oc
/** 判断频道栏尾部按钮是否可以被点击
 *  enable:yes可以被点击 
 */
- (void)judgeChannelBarTailBtnIsEnableClick:(BOOL)enable;
```
b.隐藏或者出现小红点
```oc
/** 隐藏或者出现小红点
 *  hidden：yes隐藏
 *  index：topBar 中频道栏的index
 */
- (void)redPonitIsHidden:(BOOL)hidden withIndex:(NSInteger)index;
```

###Remind
* ARC
* iOS >= 7.0
* iPhone \ iPad 
       
## Hope
* If you find bug when used，Hope you can Issues me，Thank you or try to download the latest code of this framework to see the BUG has been fixed or not
* If you find the function is not enough when used，Hope you can Issues me，I very much to add more useful function to this framework ，Thank you !
