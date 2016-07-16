//
//  countDownView.m
//  视频播放AVKit
//
//  Created by 王奥东 on 16/7/16.
//  Copyright © 2016年 王奥东. All rights reserved.
//

#import "countDownView.h"

@interface countDownView()


@end

//倒计时时间与休息的总时间
static int countDownTime = 60;
static int restTime = 60;



@implementation countDownView


//载有倒计时的view
-(UIView *)viewOfCountDown{
    //装载信息的baskView
    UIView *baskeView = [[UIView alloc]init];
    
    //顶部可点击的button
    
    
    
    UIButton *topImageButton = [[UIButton alloc]initWithFrame:CGRectMake(100, 40, 200, 100)];
    [topImageButton setImage:[UIImage imageNamed:@"天空-栏杆"] forState:UIControlStateNormal];
    
    self.topImageButton = topImageButton;
    [baskeView addSubview:topImageButton];
    
    
    
    //倒计时
    UIButton *countDownButton = [[UIButton alloc]initWithFrame:CGRectMake(100, CGRectGetMaxY(topImageButton.frame)+20, 100, 100)];
    
    countDownButton.backgroundColor = [UIColor whiteColor];
    
    NSString *countDownMsg = [NSString stringWithFormat:@"%d",countDownTime];
    [countDownButton setTitle:countDownMsg forState:UIControlStateNormal];
    [countDownButton addTarget:self action:@selector(clickCountDownButton:) forControlEvents:UIControlEventTouchUpInside];
    
    countDownButton.font = [UIFont systemFontOfSize:15];
    
    
    [countDownButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    countDownButton.layer.cornerRadius = 50;
    countDownButton.layer.masksToBounds = YES;
    

    [baskeView addSubview:countDownButton];
    self.countDownButton = countDownButton;

 
    //通过NSTimer设置倒计时
    NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(countTime) userInfo:nil repeats:YES];
    self.timer = timer;
    
    baskeView.backgroundColor = [UIColor orangeColor];
  
    
    [self setNeedsDisplay];
    return baskeView;
}


//按钮的点击事件
-(void)clickCountDownButton:(UIButton *)sender{
    
    [self.timer invalidate];
    self.timer = nil;
    
}

-(void)drawRect:(CGRect)rect{
    
  
    //开启上下文
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(200, 200), NO, 0.0);
    
    //绘制按钮的圆形进度
//    CGPoint center = CGPointMake(self.countDownButton.frame.origin.x+self.countDownButton.frame.size.width/2, self.countDownButton.frame.origin.y+self.countDownButton.frame.size.height/2);
    CGPoint center = CGPointMake(100, 100);
    //开始角度为270°，即为上端，结束为休息总时间 / 360°乘与当前剩余时间
    CGFloat endAngle = restTime / M_PI_2 *countDownTime;
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:center radius:50 startAngle:M_PI + M_PI / 2 endAngle:endAngle clockwise:YES];
    
    path.lineWidth = 5;
    
    [[UIColor greenColor]set];
    //    //非填充路径
    [path stroke];
    
    UIImage *CirImg = UIGraphicsGetImageFromCurrentImageContext();
    UIImageView *cirImgView = [[UIImageView alloc]initWithFrame:self.countDownButton.frame];
    cirImgView.backgroundColor = [UIColor blackColor];
    cirImgView.image = CirImg;
    
    [self addSubview:cirImgView];
    
    
    
    
    //关闭上下文
    UIGraphicsEndImageContext();
    
    
}

//时间的倒计时
-(void)countTime{
    
    if (countDownTime == 0) {
        
        [self.timer invalidate];
        self.timer = nil;
        
        
    }else{
        countDownTime--;
        NSString *countDownMsg = [NSString stringWithFormat:@"%d",countDownTime];
        [self setNeedsDisplay];
//        self setNeedsDisplayInRect:<#(CGRect)#>
        self.countDownButton.titleLabel.text = countDownMsg;
    }
    
    
}


@end
