//
//  UIView+DWQExtension.m
//  DWQSelectAttributes
//
//  Created by 杜文全 on 14/7/13.
//  Copyright © 2014年 com.sdzw.duwenquan. All rights reserved.
//

#import "UIView+DWQExtension.h"

@implementation UIView (DWQExtension)


-(void)setDwq_x:(CGFloat)dwq_x{
    CGRect frame = self.frame;
    frame.origin.x = dwq_x;
    self.frame = frame;

}

-(void)setDwq_y:(CGFloat)dwq_y{
    
    CGRect frame = self.frame;
    frame.origin.y = dwq_y;
    self.frame = frame;
}

-(CGFloat)dwq_x{
    
    return self.frame.origin.x;
}

-(CGFloat)dwq_y{
    
    return self.frame.origin.y;
}

-(void)setDwq_centerX:(CGFloat)dwq_centerX{

    CGPoint center = self.center;
    center.x = dwq_centerX;
    self.center = center;
}


-(CGFloat)dwq_centerX{
    
    return self.center.x;
}

-(void)setDwq_centerY:(CGFloat)dwq_centerY{

    CGPoint center = self.center;
    center.y = dwq_centerY;
    self.center = center;
}


-(CGFloat)dwq_centerY{
    
    return self.center.y;
}

-(void)setDwq_width:(CGFloat)dwq_width{
    CGRect frame = self.frame;
    frame.size.width = dwq_width;
    self.frame = frame;

}
-(void)setDwq_height:(CGFloat)dwq_height{
    CGRect frame = self.frame;
    frame.size.height = dwq_height;
    self.frame = frame;

}


-(CGFloat)dwq_height{
    
    return self.frame.size.height;
}

-(CGFloat)dwq_width{
    
    return self.frame.size.width;
}

-(void)setDwq_size:(CGSize)dwq_size{

    CGRect freme = self.frame;
    freme.size = dwq_size;
    self.frame = freme;

}


-(CGSize)dwq_size{
    
    return self.frame.size;
}

-(void)setDwq_origin:(CGPoint)dwq_origin{
   
    CGRect frame = self.frame;
    frame.origin = dwq_origin;
    self.frame = frame;
}

-(CGPoint)dwq_origin{
    
    return self.frame.origin;
}


@end
