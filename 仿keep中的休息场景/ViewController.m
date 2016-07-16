//
//  ViewController.m
//  仿keep中的休息场景
//
//  Created by 王奥东 on 16/7/16.
//  Copyright © 2016年 王奥东. All rights reserved.
//

#import "ViewController.h"
#import "countDownView.h"
#import "countDownV.h"


@interface ViewController ()



@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
   
    
    //休息页面信息
    countDownV *countDown = [[countDownV alloc]initWithFrame:self.view.bounds];
    countDown.backgroundColor = [UIColor orangeColor];
    [countDown viewOfCountDown];
    
    [self.view addSubview:countDown];
    
    //给View注册一个手势监听，点击后应跳过当前页面
    UITapGestureRecognizer *recognizer = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(clickCountDown:)];
    
    [countDown addGestureRecognizer:recognizer];
    
    //给View里按钮添加一个事件，点击后应跳到详情
    [countDown.topImageButton addTarget:self action:@selector(clickTopButton:) forControlEvents:UIControlEventTouchUpInside];
    
    

    
   
}

-(void)clickTopButton:(UIButton *)sender{
    
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"此时应跳到详情" message:nil delegate:nil cancelButtonTitle:@"Keeper~" otherButtonTitles:nil, nil];
    
    [alert show];
    
}

-(void)clickCountDown:(UITapGestureRecognizer *)recognize{
    
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"此时应跳过当前页" message:nil delegate:nil cancelButtonTitle:@"Keeper~" otherButtonTitles:nil, nil];
    
    [alert show];
    
    
}






@end
