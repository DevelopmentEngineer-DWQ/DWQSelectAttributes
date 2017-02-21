//
//  DWQSelectAttributes.m
//  DWQSelectAttributes
//
//  Created by 杜文全 on 15/5/21.
//  Copyright © 2015年 com.sdzw.duwenquan. All rights reserved.
//

#import "DWQSelectAttributes.h"

@implementation DWQSelectAttributes

-(instancetype)initWithTitle:(NSString *)title titleArr:(NSArray *)titleArr andFrame:(CGRect)frame{
    
    self = [super initWithFrame:frame];
    if (self) {
        
        self.frame = frame;
        self.title = title;
        
        self.attributesArray = [NSArray arrayWithArray:titleArr];
        
        [self rankView];
    }
    return self;
}


-(void)rankView{
    
    self.packView = [[UIView alloc] initWithFrame:self.frame];
    self.packView.dwq_y = 0;
    
    UILabel *line = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, screen_Width, 0.5)];
    line.backgroundColor = [UIColor lightGrayColor];
    [self.packView addSubview:line];
    
    UILabel *titleLB = [[UILabel alloc] initWithFrame:CGRectMake(20, 5, screen_Width, 25)];
    titleLB.text = self.title;
    titleLB.font = FONT(15);
    [self.packView addSubview:titleLB];
    
    self.btnView = [[UIView alloc] initWithFrame:CGRectMake(0,CGRectGetMaxY(titleLB.frame), screen_Width, 40)];
    [self.packView addSubview:self.btnView];
    
    int count = 0;
    float btnWidth = 0;
    float viewHeight = 0;
    for (int i = 0; i < self.attributesArray.count; i++) {
        
        NSString *btnName = self.attributesArray[i];
        
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [btn setBackgroundColor:BackgroundColor];
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
        
        btn.titleLabel.font = [UIFont systemFontOfSize:14];
        [btn setTitle:btnName forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        
        btn.layer.cornerRadius = 5;
        btn.layer.masksToBounds = YES;
        
        NSDictionary *dict = [NSDictionary dictionaryWithObject:FONT(13) forKey:NSFontAttributeName];
        CGSize btnSize = [btnName sizeWithAttributes:dict];
        
        btn.dwq_width = btnSize.width + 15;
        btn.dwq_height = btnSize.height + 12;
        
        if (i==0)
        {
            btn.dwq_x = 20;
            btnWidth += CGRectGetMaxX(btn.frame);
        }
        else{
            btnWidth += CGRectGetMaxX(btn.frame)+20;
            if (btnWidth > screen_Width) {
                count++;
                btn.dwq_x = 20;
                btnWidth = CGRectGetMaxX(btn.frame);
            }
            else{
                
                btn.dwq_x += btnWidth - btn.dwq_width;
            }
        }
        btn.dwq_y += count * (btn.dwq_height+10)+10;
        
        viewHeight = CGRectGetMaxY(btn.frame)+10;
        
        [self.btnView addSubview:btn];
        
        btn.tag = 10000+i;
        
        
        //        if ([btnName isEqualToString:self.selectStr])
        //        {
        //            self.selectBtn = btn;
        //            self.selectBtn.selected = YES;
        //            self.selectBtn.backgroundColor = [UIColor greenColor];
        //        }
        
    }
    self.btnView.dwq_height = viewHeight;
    self.packView.dwq_height = self.btnView.dwq_height+CGRectGetMaxY(titleLB.frame);
    
    self.dwq_height = self.packView.dwq_height;
    
    [self addSubview:self.packView];
}


-(void)btnClick:(UIButton *)btn{
    
    
    if (![self.selectBtn isEqual:btn]) {
        
        self.selectBtn.backgroundColor = BackgroundColor;
        self.selectBtn.selected = NO;
        
        //        NSLog(@"%@-----%@",btn.titleLabel.text,[self.rankArray[btn.tag-10000] sequence]);
    }
    else{
        btn.backgroundColor = SelectColor;
    }
    btn.backgroundColor = SelectColor;
    btn.selected = YES;
    
    self.selectBtn = btn;
    
    if ([self.delegate respondsToSelector:@selector(selectBtnTitle:andBtn:)]) {
        
        [self.delegate selectBtnTitle:btn.titleLabel.text andBtn:self.selectBtn];
    }
}

@end
