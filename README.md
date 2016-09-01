# NewsChannel

## Ready
#### 新闻频道栏（网易新闻，新浪新闻，搜狐新闻，今日头条，聚划算，腾讯视频，优酷等类似的频道栏）<br>
#### 支持小红点标识 &amp;&amp; 懒加载 &amp;&amp; 缓存 &amp;&amp; 排序 &amp;&amp; 增删等。<br><br>

### 一言不合就上效果图
<img src="https://raw.githubusercontent.com/jinht/NewsChannel/master/ReadMEImages/Gif/slide.gif"  width=200 height=350 />
&emsp;<img src="https://raw.githubusercontent.com/jinht/NewsChannel/master/ReadMEImages/Gif/shake.gif" width=200 height=350 />
&emsp;<img src="https://raw.githubusercontent.com/jinht/NewsChannel/master/ReadMEImages/Gif/deleteAndAdd.gif"  width=200 height=350 />
&emsp;<img src="https://raw.githubusercontent.com/jinht/NewsChannel/master/ReadMEImages/Gif/redPoint.gif"  width=200 height=350 />

### Function Description
1. 单个频道小红点标识：JhtNewsChannelItemModel中`isShowRedPoint`为BOOL值，在生成频道栏数据Model时可以一起添加频道是否有小红点标识，在后续调接口设置小红点状态依旧照前述可以实现；
2. 懒加载：页面不会全部加载（非scrollview），点击或者滑动到哪里加载相应页面，同时可以自己设置缓存的个数；
3. 频道位置固定：可以设置单个或多个频道位置不可变动；
4. 频道栏排序：可以在排序界面进行自定义排序（会有颤抖提示）；
5. 频道增删：可以在排序界面进行自定义的增删频道，同时囊括排序功能。<br>
注：排序或者增删之后的相应页面均可在缓存中找到！


## GO
### How to use
1. 个性设置<br>
&emsp;a. JhtNewsChannelItemModel：顶部频道Model，你可以继承这个model，来扩展满足自己需求的model；<br>
&emsp;b. JhtChannelBarAndSlideViewConnectParamModel: 用于频道栏字号，字间距，颜色，缓存页数等等的设置的参数model，注意: channelArray：频道数组这个属性，是用于存储`JhtNewsChannelItemModel`的数组；<br>
&emsp;c. 可以通过设置JhtChannelBarAndSlideViewConnectParamModel中`notMoveNameArray`参数设置频道位置固定；<br>
&emsp;d. JhtNewsChannelItemEditParamModel: 用于排序界面中相关设置参数model。

2. 建立滑频道条和可滑动的view：相关个性化设置均由传递的Model中参数实现
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

3. JhtTotalSlideViewDelegate 方法
```oc
@protocol JhtTotalSlideViewDelegate <NSObject>
/** VC总数量 */
- (NSInteger)numberOfTabsInJhtTotalSlideView:(JhtTotalSlideView *)sender;
/** 当前index下的VC */
- (UIViewController *)JhtTotalSlideView:(JhtTotalSlideView *)sender controllerAt:(NSInteger)index;

/** 点击VC的index */
- (void)JhtTotalSlideView:(JhtTotalSlideView *)sender didSelectedAt:(NSInteger)index;

/** 排序之后的操作
 *  modelArr：model数组
 *  nameArray：名字数组
 *  selectedIndex：选中的index
 */
- (void)JhtTotalSlideViewWithSortModelArr:(NSArray *)modelArr withNameArray:(NSArray *)nameArray withSelectIndex:(NSInteger)selectedIndex;
```

4.  `JhtChannelBarAndSlideViewConnect` 方法
&emsp;a. 判断频道栏尾部按钮是否可以被点击
```oc
/** 判断频道栏尾部按钮是否可以被点击
 *  enable:yes可以被点击 
 */
- (void)judgeChannelBarTailBtnIsEnableClick:(BOOL)enable;
```
&emsp;b.隐藏或者出现小红点
```oc
/** 隐藏或者出现小红点
 *  hidden：yes隐藏
 *  index：topBar 中频道栏的index
 */
- (void)redPonitIsHidden:(BOOL)hidden withIndex:(NSInteger)index;
```

5.  修改SDK切图资源
&emsp;如需替换SDK中的切图资源可以直接将`JhtNewsChannelImages.bundle`中的切图同名替换即可

###Remind
* ARC
* iOS >= 7.0
* iPhone \ iPad 
       
## Hope
* If you find bug when used，Hope you can Issues me，Thank you or try to download the latest code of this framework to see the BUG has been fixed or not
* If you find the function is not enough when used，Hope you can Issues me，I very much to add more useful function to this framework ，Thank you !
