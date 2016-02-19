#Xib 中 UIScrollView的自动布局

*  **使用场景** 我们在使用XIB或者StoryBoard的时候   经常会使用到UIScrollView ，但是如果想使用XIb 进行UIScrollView自动布局(AutoLayout)复杂 ，因为scrollview本身contentSize、contentInsets等复杂的特性导致
* 让我们来看下 在XIB中UIScrollView的自动布局的几种方法

**效果**
![](http://upload-images.jianshu.io/upload_images/1418424-a01edf0647d1aaa0.gif?imageMogr2/auto-orient/strip)

* 这里我们以竖屏为例 

** 1 . 第一步 --> ScrollView**
 * 新创建一个项目 ，拖动一个UIScrollView到StoryBoard中 并给ScrollView添加约束

![1-拖动一个ScrollView](http://upload-images.jianshu.io/upload_images/1418424-8450a58e55abcf98.jpg?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)


![1-给ScrollView添加相对于SuperView的约束](http://upload-images.jianshu.io/upload_images/1418424-5881ada668a2f949.jpg?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

** 2 . 第二步 -->Contain View**
1. 在拖动一个View(将其命名为Contain VIew)到ScrollView上，然后添加上下左右的约束
**注意** ：这个 ScrollView就是根据这个Contain View 来确定ContentSize的大小的
![2-添加Contain View约束](http://upload-images.jianshu.io/upload_images/1418424-21e23d2a8f18d687.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
**特别提醒** ：**添加完 Contain View的约束后~Xcode 会报错 暂时先别管** 

2. 根据横竖屏 设置Contain View的额外约束
    *  我们需要先确定 我们ScrollView是`横屏`滚动还是 `竖屏`滚动
    *  如果 横竖屏都需要滚动的话  就不需要添加下面的约束

    a .横屏滚动 

![3-根据横竖屏 添加Contain View的额外约束条件](http://upload-images.jianshu.io/upload_images/1418424-95d4315138996e87.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

   3 . 设置Contain View的高度(如果是横屏的就要设置宽度)
   * 通过设置Contain View的宽度来确定 ScrollView 的高度
   *  如果想动态设置ScrollView的高度，我们可以将这个高度的约束 拉出去~然后该成属性
  然后在修改

![4-ContainView的高度约束](http://upload-images.jianshu.io/upload_images/1418424-b305a0d8dc8b1619.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

4.如果是确定的宽度 可以在updateViewConstraints方法中修改，也可以在别的地方修改
```
//更新约束
- (void)updateViewConstraints
{
    [super updateViewConstraints];
    //设置ContentSize为3个屏幕的宽度
    self.ViewHeight.constant= CGRectGetHeight([UIScreen mainScreen].bounds)*3;
}
```

**3.第三步 -->添加Contain View内的UI控件  **
* 现在就可以 竖直滚动了 只是ScrollView里面没有元素而已 有的就是 一个 Contain View的宽高的 空间
* **所以我们现在要做的就是 向一个View（Contain View）中添加 内容**
***
![3-为需要添加的三个视图 添加约束](http://upload-images.jianshu.io/upload_images/1418424-1293d808aac07f90.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

* 然而的上面的约束 并没有 设置 三个View的高度  
* 我们可以 添加通过代码 手动设置 这几个视图的高度  
![添加视图高度的约束](http://upload-images.jianshu.io/upload_images/1418424-275fc2fa65765dfd.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
* 通过代码设置 这几个视图的高度

```
//更新约束
- (void)updateViewConstraints
{
    [super updateViewConstraints];
    //设置ContentSize为3个屏幕的宽度
    self.ViewHeight.constant= CGRectGetHeight([UIScreen mainScreen].bounds)*3;
    //第二个视图top距离SuperView的距离 也就是第一个视图的高度
   self.secondViewTop.constant=CGRectGetHeight([UIScreen mainScreen].bounds);
    //第三个视图top 距离SuperView的距离 也就是第二个视图的高度
    self.threeViewTop.constant=CGRectGetHeight([UIScreen mainScreen].bounds)*2;
    //第三个视图的高度= ContentSize.height(self.ViewHeight.constant)-(self.threeViewTop.constant)
}
```

#相关文章 
[如何对scrollview进行自动布局](http://blog.csdn.net/lihuiqwertyuiop/article/details/39320091?utm_source=tuicool&utm_medium=referral)

#请关注我的微博：
**[李攀祥的微博](http://weibo.com/3948326193/profile?topnav=1&wvr=6&is_all=1)**

