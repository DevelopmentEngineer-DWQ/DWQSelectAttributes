//
//  ViewController.m
//  DWQSelectAttributes
//
//  Created by 杜文全 on 15/5/21.
//  Copyright © 2015年 com.sdzw.duwenquan. All rights reserved.
//
#define screen_Width [UIScreen mainScreen].bounds.size.width
#define screen_Height [UIScreen mainScreen].bounds.size.height
#import "ViewController.h"

@interface ViewController ()<SelectAttributesDelegate>

@property(nonatomic,strong)UIView *backgroundView;

@property(nonatomic,strong)NSArray *standardList;
@property(nonatomic,strong)NSArray *standardValueList;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createUI];
   
}
-(void)createUI{

    self.view.backgroundColor = [UIColor whiteColor];
    
    self.backgroundView = [[UIView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:self.backgroundView];

    UIImageView *logo=[[UIImageView alloc]initWithFrame:CGRectMake(80, 80, screen_Width-160, 150)];
    logo.image=[UIImage imageNamed:@"DWQ-LOGO.jpeg"];
    
    [self.view addSubview:logo];
    
    
    UILabel *JS=[[UILabel alloc]initWithFrame:CGRectMake(40, 260, screen_Width-40, 20)];
    JS.text=@"简  书：iOS攻城狮DWQ";
    JS.textColor=[UIColor redColor];
    [self.view addSubview:JS];
    
    UILabel *GitHub=[[UILabel alloc]initWithFrame:CGRectMake(40, 300, screen_Width-40, 20)];
    GitHub.textColor=[UIColor blueColor];
    GitHub.text=@"Github: DevelopmentEngineer-DWQ";
    [self.view addSubview:GitHub];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(0, screen_Height-40, screen_Width, 40);
    [btn setTitle:@"弹出规格框" forState:0];
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    btn.backgroundColor = [UIColor colorWithRed:245 green:56 blue:64 alpha:1];
    [btn addTarget:self action:@selector(chooseViewClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    
    self.standardList = @[@"颜色",@"尺寸"];
    self.standardValueList = @[@[@"紫色",@"蓝色",@"灰色",@"黄黄",@"红色",@"青色",@"紫色",@"蓝色",@"灰色",@"黄黄",@"红色",@"绿色",@"白色",@"黑色"],@[@"s",@"m",@"l",@"xl",@"xxl",@"xxxl",@"xxxm",@"xxxxxxxxxxxx"]];
    
    [self initSelectView];
}
-(void)initSelectView{
    
    self.selectView = [[DWQSelectView alloc] initWithFrame:CGRectMake(0, screen_Height, screen_Width, screen_Height)];
    self.selectView.headImage.image = [UIImage imageNamed:@"凯迪拉克.jpg"];
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
}


-(void)addGoodsCartBtnClick{
    
    
    NSLog(@"立即购买成功");
}

#pragma mark --弹出规格属性
-(void)chooseViewClick{
    NSLog(@"--------");
    
    
    [UIView animateWithDuration: 0.35 animations: ^{
        self.backgroundView.transform = CGAffineTransformScale(CGAffineTransformIdentity, 0.9, 0.9);
        self.selectView.frame =CGRectMake(0, 0, screen_Width, screen_Height);
    } completion: nil];
    
}

/**
 *  点击半透明部分或者取消按钮，弹出视图消失
 */
-(void)dismiss
{
    //    center.y = center.y+self.view.frame.size.height;
    [UIView animateWithDuration: 0.35 animations: ^{
        self.selectView.frame =CGRectMake(0, screen_Height, screen_Width, screen_Height);
        self.backgroundView.transform = CGAffineTransformIdentity;
    } completion: nil];
    
}
-(NSMutableArray *)attributesArray{
    
    if (_attributesArray == nil) {
        
        _attributesArray = [[NSMutableArray alloc] init];
    }
    return _attributesArray;
}

-(void)selectBtnTitle:(NSString *)title andBtn:(UIButton *)btn{
    
    [self.attributesArray removeAllObjects];
    
    for (int i=0; i < _standardList.count; i++)
    {
        DWQSelectAttributes *view = [self.view viewWithTag:8000+i];
        
        for (UIButton *obj in  view.btnView.subviews)
        {
            if(obj.selected){
                
                for (NSArray *arr in self.standardValueList)
                {
                    for (NSString *title in arr) {
                        
                        if ([view.selectBtn.titleLabel.text isEqualToString:title]) {
                            
                            [self.attributesArray addObject:view.selectBtn.titleLabel.text];
                        }
                    }
                }
            }
        }
    }
    NSLog(@"%@",self.attributesArray);
}




@end
