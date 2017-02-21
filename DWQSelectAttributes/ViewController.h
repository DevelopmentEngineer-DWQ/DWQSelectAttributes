//
//  ViewController.h
//  DWQSelectAttributes
//
//  Created by 杜文全 on 15/5/21.
//  Copyright © 2015年 com.sdzw.duwenquan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DWQSelectAttributes.h"
#import "DWQSelectView.h"
@interface ViewController : UIViewController
@property(nonatomic,strong)DWQSelectView *selectView;
@property(nonatomic,strong)DWQSelectAttributes *selectAttributes;

@property(nonatomic,strong)NSMutableArray *attributesArray;

@end

