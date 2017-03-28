## NewsChannel

## Ready
#### 新闻频道栏（网易新闻，新浪新闻，搜狐新闻，今日头条，聚划算，腾讯视频，优酷等类似的频道栏）<br>
#### 支持小红点标识 &amp;&amp; 懒加载 &amp;&amp; 缓存 &amp;&amp; 排序 &amp;&amp; 增删等。<br><br>

### 一言不合就上效果图
<img src="https://raw.githubusercontent.com/jinht/NewsChannel/master/ReadMEImages/Gif/slide.gif" width=200 height=350 />&emsp;<img src="https://raw.githubusercontent.com/jinht/NewsChannel/master/ReadMEImages/Gif/shake.gif" width=200 height=350 />&emsp;<img src="https://raw.githubusercontent.com/jinht/NewsChannel/master/ReadMEImages/Gif/deleteAndAdd.gif" width=200 height=350 />&emsp;<img src="https://raw.githubusercontent.com/jinht/NewsChannel/master/ReadMEImages/Gif/redPoint.gif" width=200 height=350 />

### Function Description
1. 单个频道小红点标识：JhtNewsChannelItemModel中`isShowRedPoint`为BOOL值，在生成频道栏数据Model时可以一起添加频道是否有小红点标识，在后续调接口设置小红点状态依旧照前述可以实现
2. 懒加载：页面不会全部加载（非scrollview），点击或者滑动到哪里加载相应页面，同时可以自己设置缓存的个数
3. 频道位置固定：可以设置单个或多个频道位置不可变动
4. 频道栏排序：可以在排序界面进行自定义排序（会有颤抖提示）
5. 频道增删：可以在排序界面进行自定义的增删频道，同时囊括排序功能
6. 说明：排序或者增删之后的相应页面均可在缓存中找到


## GO
### How to use
#### 1. 个性化设置<br>
&emsp;a. JhtNewsChannelItemModel：顶部频道Model，你可以继承这个model，来扩展满足自己需求的model；<br>
&emsp;b. JhtChannelBarAndSlideViewConnectParamModel：用于切换频道栏界面中相关设置参数model，包含`尾部加号按钮` && `颜色和字号` && `间距和坐标` && `缓存页数` 等相关设置；<br>
&emsp;c. JhtChannelBarAndSlideViewConnectParamModel中的属性`notMoveNameArray`（不能移动频道的名字数组）设置频道位置固定, `toAddItemArray`（用于存储JhtNewsChannelItemModel）属性用于设置待添加的频道数组；<br>
&emsp;d. JhtNewsChannelItemEditParamModel：用于排序界面中相关设置参数model，包含`文字` && `文字颜色` && `距离` && `背景颜色` 类等相关设置。<br>
&emsp;e. JhtChannelBarAndSlideViewConnectParamModel和JhtNewsChannelItemEditParamModel结构如下图<br>
<img src="https://raw.githubusercontent.com/jinht/NewsChannel/master/ReadMEImages/ModelStructureDiagram/connectParamModel.png" width=210 height=327 />&emsp;<img src="https://raw.githubusercontent.com/jinht/NewsChannel/master/ReadMEImages/ModelStructureDiagram/editParamModel.png" width=244 height=329 />
* 注：model内部均注有required/optional区分标识<br>
&emsp;&emsp;1. required：必要参数，需要进行相关传递<br>
&emsp;&emsp;2. optional：个性化配置参数，内部均有相应默认值，已做详细标注

#### 2. 建立滑频道条和可滑动的view：相关个性化设置均由传递的Model中参数实现
```oc
/** 创建ChannelBarAndSliderView和排序删除界面
 *  barAndSlideModel：用于设置sliderView和bar参数model（含有部分属性默认值）
 *  itemEditModel：用于排序界面的参数设置（含有部分属性默认值）
 *  withIsExistNavOrTab：是否含有NavigationBar || TabBar_枚举
 *  channelArray：已经添加的频道数组 存储JhtNewsChannelItemModel (必要参数，并且是存储JhtNewsChannelItemModel的数组)
 *  baseViewController：所处于的VC
 *  delegate：代理
 */
- (id)initSlideViewAndItemEditViewWithBarAndSlideModel:(JhtChannelBarAndSlideViewConnectParamModel *)barAndSlideModel withNewsChannelItemEditModel:(JhtNewsChannelItemEditParamModel *)itemEditModel withIsExistNavOrTab:(NT_IsExist)isExistType  withChanelArray:(NSMutableArray *)channelArray withBaseViewController:(id)baseViewController withDelegte:(id<JhtTotalSlideViewDelegate>)delegate;
```

#### 3. JhtTotalSlideViewDelegate 方法
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

#### 4. `JhtChannelBarAndSlideViewConnect` 方法
&emsp;a. 判断频道栏尾部按钮是否可以被点击
```oc
/** 判断频道栏尾部按钮是否可以被点击
 *  enable:yes可以被点击 
 */
- (void)judgeChannelBarTailBtnIsEnableClick:(BOOL)enable;
```
&emsp;b. 隐藏或者出现小红点
```oc
/** 隐藏或者出现小红点
 *  hidden：yes隐藏
 *  index：topBar 中频道栏的index
 */
- (void)redPonitIsHidden:(BOOL)hidden withIndex:(NSInteger)index;
```

#### 5. 修改SDK切图资源
&emsp;如需替换SDK中的切图资源可以直接将`JhtNewsChannelImages.bundle`中的切图同名替换即可
<br>

* 注：1. 对一些用户反馈的`缓存`疑惑统一解释一下，上面提到的缓存指的是，创建频道下的VC后且`app未重启`的情况下，进行频道编辑后，内部会优先使用之前创建的VC，假使不存在会重新创建新VC<br>
&emsp;&emsp;2. 假使你想做频道编辑后的持久化存储可以在以下方法中实现
<img src="https://cloud.githubusercontent.com/assets/13724367/21304949/9f752672-c603-11e6-9d1a-bd1b91ebb7fa.jpg"/>
&emsp;&emsp;&emsp;&emsp;3. 在demo中可以查看相关的使用和配置方法，demo中已做详细标注<br>
&emsp;&emsp;&emsp;&emsp;4. 最后，感谢大家长久以来的支持！
      
 
### Remind
* ARC
* iOS >= 7.0
* iPhone \ iPad 
       

## Hope
* If you find bug when used，Hope you can Issues me，Thank you or try to download the latest code of this framework to see the BUG has been fixed or not
* If you find the function is not enough when used，Hope you can Issues me，I very much to add more useful function to this framework ，Thank you !
