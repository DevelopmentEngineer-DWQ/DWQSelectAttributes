//
//  DWQSelectView.h
//  DWQSelectAttributes
//
//  Created by 杜文全 on 15/5/21.
//  Copyright © 2015年 com.sdzw.duwenquan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DWQSelectView : UIView
@property(nonatomic,strong)UIView *alphaView;
@property(nonatomic,strong)UIView *whiteView;

@property(nonatomic,strong)UIImageView *headImage;

@property(nonatomic,strong)UILabel *LB_price;
@property(nonatomic,strong)UILabel *LB_stock;
@property(nonatomic,strong)UILabel *LB_detail;
@property(nonatomic,strong)UILabel *LB_line;
@property(nonatomic,strong)UILabel *LB_showSales;


@property(nonatomic,copy)NSString *price;
@property(nonatomic,copy)NSString *stock;
@property(nonatomic,copy)NSString *detail;
@property(nonatomic,copy)NSString *showSales;

@property(nonatomic,strong)UIScrollView *mainscrollview;


@property(nonatomic,strong)UIButton *cancelBtn;
@property(nonatomic,strong)UIButton *buyBtn;
@property(nonatomic,strong)UIButton *addBtn;
@property(nonatomic,strong)UIButton *stockBtn;

@property(nonatomic,assign) int typeCount;

@property(nonatomic,strong)UIButton *selectBtn;


-(instancetype)initWithFrame:(CGRect)frame;


@end
