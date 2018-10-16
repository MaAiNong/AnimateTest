//
//  ViewController.m
//  AnimateTest
//
//  Created by xukaitiankevin on 2018/10/8.
//  Copyright © 2018年 xukaitian. All rights reserved.
//

#import "ViewController.h"
#import "QYCreditFinishHintAnimation.h"
@interface ViewController ()
@property(nonatomic,strong)QYCreditFinishHintAnimation* creditFinishHintAnimation;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    // Do any additional setup after loading the view, typically from a nib.
    [self.view addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(showAnimate)]];
}


-(void)showAnimate
{
    if (_creditFinishHintAnimation) {
        [_creditFinishHintAnimation removeFromSuperview];
        _creditFinishHintAnimation = nil;
    }
    self.creditFinishHintAnimation = [[QYCreditFinishHintAnimation alloc] initWithFrame:CGRectMake(self.view.frame.size.width-364/2,
                                                                                 self.view.frame.size.height-380/2,
                                                                                                        364/2 ,
                                                                                                        380/2)];

    [self.view addSubview:self.creditFinishHintAnimation];
    [self.creditFinishHintAnimation startAnimate];
}

@end
