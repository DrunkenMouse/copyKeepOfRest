//
//  countDownV.m
//  仿keep中的休息场景
//
//  Created by 王奥东 on 16/7/16.
//  Copyright © 2016年 王奥东. All rights reserved.
//

#import "countDownV.h"

//倒计时时间与休息的总时间
static int countDownTime = 60;
static int restTime = 60;
@interface countDownV()
@property(nonatomic,strong)UILabel *textLabel;

@end


@implementation countDownV

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        
    }
    return self;
}



-(void)viewOfCountDown{
    
    //设置顶端的提示按钮显示
    UIButton *topImageButton = [[UIButton alloc]initWithFrame:CGRectMake(100, 40, 200, 100)];
    [topImageButton setImage:[UIImage imageNamed:@"天空-栏杆"] forState:UIControlStateNormal];
    
    self.topImageButton = topImageButton;
    [self addSubview:topImageButton];

    
    //设置中间提示信息
    self.textLabel = [[UILabel alloc]initWithFrame:CGRectMake(100, 300 - 40, 200, 80)];
    NSString *countDownMsg = [NSString stringWithFormat:@"%d",countDownTime];
    self.textLabel.text = countDownMsg;
    
    self.textLabel.font = [UIFont systemFontOfSize:80];
    
    self.textLabel.textColor = [UIColor whiteColor];
    self.textLabel.textAlignment = NSTextAlignmentCenter;
    
    
    [self addSubview:self.textLabel];
    
    
    
    //通过NSTimer设置倒计时
    NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(countTime) userInfo:nil repeats:YES];
    self.timer = timer;
}

//时间的倒计时
-(void)countTime{
    
    if (countDownTime == 0) {
        
        [self.timer invalidate];
        self.timer = nil;
        
        
    }else{
        
     
        
        countDownTime--;
        NSString *countDownMsg = [NSString stringWithFormat:@"%d",countDownTime];
        self.textLabel.text = countDownMsg;
        
        [self setNeedsDisplay];
        
        
    }


}








- (void)drawRect:(CGRect)rect {
    //开启上下文
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(200, 200), NO, 0.0);
    
    //设置路径圆心
    CGPoint center = CGPointMake(100, 100);
    
    //设置路径1
    UIBezierPath *backPath = [UIBezierPath bezierPathWithArcCenter:center radius:80 startAngle:0 endAngle:M_PI*2 clockwise:YES];
    backPath.lineWidth = 5;
    
    
    [[UIColor greenColor]setStroke];
    [backPath stroke];
    
    //设置路径2
    //开始角度为270°，即为上端，结束角度为开始角度 + 休息总时间 / 360° * 当前剩余时间
  
    CGFloat startAngle = M_PI*2-M_PI/2;
    
    CGFloat endAngle = startAngle +   (360 / restTime  * (60 - countDownTime))  * (M_PI * 2 / 360) ;
    

    
    
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:center radius:80 startAngle:startAngle endAngle:endAngle clockwise:YES];
    
    path.lineWidth = 5;
    
    
    //非填充路径
   
    [[UIColor lightGrayColor]setStroke];
    [path stroke];
    
    //获取图片并显示
    UIImage *CirImg = UIGraphicsGetImageFromCurrentImageContext();
    UIImageView *cirImgView = [[UIImageView alloc]initWithImage:CirImg];
    cirImgView.frame = CGRectMake(100, 200, 200, 200);
    
    cirImgView.image = CirImg;
    

    
    [self addSubview:cirImgView];
    
    
    
    
    //关闭上下文
    UIGraphicsEndImageContext();
    
}

@end
