# DWQSelectAttributes
购买页选择商品规格属性的封装，适用于电子商务平台
![DWQ-LOGO.jpeg](http://upload-images.jianshu.io/upload_images/2231137-d59fbfb131a93c52.jpeg?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
##使用方法

   1.将DWQSelectAttributesView和DWQExtension文件夹拖入到您的工程中，</br>
   2.在PCH文件中引入头文件：DWQSelectAttributes.h
， DWQSelectView.h，UIView+DWQExtension.h</br>
    3.在需要使用规格属性选择空间的Controller中声明三个属性，代码示例如下
```objective-c
@property(nonatomic,strong)DWQSelectView *selectView;//规格属性选择控件
@property(nonatomic,strong)DWQSelectAttributes *selectAttributes;

@property(nonatomic,strong)NSMutableArray *attributesArray; //属性数组
```
    4.在声明两个数组属性，其中一个未分类，另一个为分类下的规格，和一个背景控件，然后初始化需要传入的数组，数组格式如下：
```objective-c
    @property(nonatomic,strong)UIView *backgroundView;
    @property(nonatomic,strong)NSArray *standardList;
    @property(nonatomic,strong)NSArray *standardValueList;


    self.standardList = @[@"颜色",@"尺寸"];
    self.standardValueList = @[@[@"紫色",@"蓝色",@"灰色",@"黄黄",@"红色",@"青色",@"紫色",@"蓝色",@"灰色",@"黄黄",@"红色",@"绿色",@"白色",@"黑色"],@[@"s",@"m",@"l",@"xl",@"xxl",@"xxxl",@"xxxm",@"xxxxxxxxxxxx"]];

```
    5.然后在initSelectView，对其中的控件进行赋值。部分代码示例如下：
```onjective-c
self.selectView = [[DWQSelectView alloc] initWithFrame:CGRectMake(0, screen_Height, screen_Width, screen_Height)];
    self.selectView.headImage.image = [UIImage imageNamed:@"duwenquan"];
    self.selectView.LB_price.text = @"￥121.00";
    self.selectView.LB_stock.text = [NSString stringWithFormat:@"库存%@件",@999];
    self.selectView.LB_showSales.text=@"已销售40件";
    self.selectView.LB_detail.text = @"请选择规格属性";
    [self.view addSubview:self.selectView];
    
    
    CGFloat maxY = 0;
    CGFloat height = 0;
    for (int i = 0; i < self.standardList.count; i ++)
    {
        
        self.selectAttributes = [[DWQSelectAttributes alloc] initWithTitle:self.standardList[i] titleArr:self.standardValueList[i] andFrame:CGRectMake(0, maxY, screen_Width, 40)];
        maxY = CGRectGetMaxY(self.selectAttributes.frame);
        height += self.selectAttributes.dwq_height;
        self.selectAttributes.tag = 8000+i;
        self.selectAttributes.delegate = self;
        
        [self.selectView.mainscrollview addSubview:self.selectAttributes];
    }
    self.selectView.mainscrollview.contentSize = CGSizeMake(0, height);
    
    //加入购物车按钮
    [self.selectView.addBtn addTarget:self action:@selector(addGoodsCartBtnClick) forControlEvents:UIControlEventTouchUpInside];
    //立即购买
    [self.selectView.buyBtn addTarget:self action:@selector(addGoodsCartBtnClick) forControlEvents:UIControlEventTouchUpInside];
    //取消按钮
    [self.selectView.cancelBtn addTarget:self action:@selector(dismiss) forControlEvents:UIControlEventTouchUpInside];
    //点击黑色透明视图choseView会消失
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismiss)];
    [self.selectView.alphaView addGestureRecognizer:tap];
```
    6.然后根据自己的需要来修改代码。一般需要重写的也就下面这个方法，这需要根据自己Model来针对性的进行修改，具体使用方式，查看Demo即可。
```objective-c
-(void)selectBtnTitle:(NSString *)title andBtn:(UIButton *)btn
``` 
   7.效果图如下


![规格属性选择器.gif](http://upload-images.jianshu.io/upload_images/2231137-2bdeb61dec95e689.gif?imageMogr2/auto-orient/strip)
