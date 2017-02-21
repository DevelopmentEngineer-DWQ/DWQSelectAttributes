//
//  DWQSelectAttributes.h
//  DWQSelectAttributes
//
//  Created by 杜文全 on 15/5/21.
//  Copyright © 2015年 com.sdzw.duwenquan. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "UIView+DWQExtension.h"

@protocol SelectAttributesDelegate <NSObject>
@required
-(void)selectBtnTitle:(NSString *)title andBtn:(UIButton *)btn;

@end

@interface DWQSelectAttributes : UIView

@property(nonatomic,copy)NSString *title;
@property(nonatomic,strong)NSArray *attributesArray;

@property(nonatomic,strong)UIButton *selectBtn;

@property(nonatomic,strong)UIView *packView;
@property(nonatomic,strong)UIView *btnView;

@property(nonatomic,assign)id<SelectAttributesDelegate> delegate;



-(instancetype)initWithTitle:(NSString *)title titleArr:(NSArray *)titleArr andFrame:(CGRect)frame;


@end
