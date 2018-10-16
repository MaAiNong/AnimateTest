//
//  QYCreditFinishHintAnimation.m
//  AnimateTest
//
//  Created by xukaitiankevin on 2018/10/8.
//  Copyright © 2018年 xukaitian. All rights reserved.
//

#import "QYCreditFinishHintAnimation.h"


@interface QYCreditFinishHintAnimation ()
@property(nonatomic,strong)UIImageView*myCredit;
@property(nonatomic,strong)UIImageView*myJiFen;
@property(nonatomic,strong)UILabel*myJiFenPoint;
@end

#define UIColorFromRGB(rgbValue)            [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1]

@implementation QYCreditFinishHintAnimation

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
-(id)init
{
    if (self = [super init]) {
        
        [self createSubviews];
    }
    return self;
}


-(id)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        [self createSubviews];
        
    }
    return self;
}


-(void)createSubviews
{
    self.myCredit = [[UIImageView alloc] init];
    self.myJiFen = [[UIImageView alloc] init];
    self.myJiFenPoint = [[UILabel alloc] init];
    
    self.myCredit.image = [UIImage imageNamed:@"qyMyCredit"];
    self.myJiFen.image = [UIImage imageNamed:@"qyJiFen"];
    self.myJiFenPoint.text = @"+10";
    self.myJiFenPoint.textColor = UIColorFromRGB(0xffb400);
    self.myJiFenPoint.font = [UIFont systemFontOfSize:16.0f];
    
    [self addSubview:self.myCredit];
    [self addSubview:self.myJiFen];
    [self addSubview:self.myJiFenPoint];
    
    self.backgroundColor = [UIColor clearColor];
}


-(void)startAnimate
{
    self.myCredit.frame = CGRectMake(0,self.frame.size.height, 128/2, 128/2);
    self.myJiFen.frame = CGRectMake(0,self.frame.size.height,0,0);//78/2
    self.myJiFenPoint.frame = CGRectMake(16/2, self.frame.size.height, 0, 0);
    
    self.myCredit.alpha =0.0f;
    self.myJiFen.alpha = 0.0f;
    self.myJiFenPoint.alpha = 0.0f;
    
    [UIView animateWithDuration:0.4 animations:^{
       
        self.myCredit.frame = CGRectMake(0,self.frame.size.height - 100/2 - 128/2 , 128/2, 128/2);
        self.myJiFen.frame = CGRectMake(2,self.frame.size.height-324/2-56/2,56/2, 56/2);
        self.myJiFenPoint.frame = CGRectMake(2+56/2+16/2, self.frame.size.height-324/2-56/2, 100,56/2);
        self.myCredit.alpha = 1.0f;
        self.myJiFen.alpha = 1.0f;
        self.myJiFenPoint.alpha = 1.0f;
        
    } completion:^(BOOL finished) {
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.8 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [self stopAnimate];
        });
    }];
}


-(void)stopAnimate
{
    [UIView animateWithDuration:0.2 animations:^{
        
        self.myJiFen.frame = CGRectMake(self.myCredit.center.x,self.myCredit.center.y,0, 0);
        self.myJiFenPoint.frame = CGRectMake(self.myCredit.center.x,self.myCredit.center.y,0, 0);
        
        self.myJiFen.alpha = 0.0f;
        self.myJiFenPoint.alpha = 0.0f;
        
    } completion:^(BOOL finished) {
        
        [UIView animateWithDuration:0.2 animations:^{
            
            self.myCredit.frame = CGRectMake(0,self.frame.size.height, 128/2, 128/2);
            self.myCredit.alpha = 0.0f;
            
        } completion:^(BOOL finished) {
            
            [self removeFromSuperview];
            
        }];
        
    }];
}
@end
