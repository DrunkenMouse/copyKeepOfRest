//
//  countDownView.h
//  视频播放AVKit
//
//  Created by 王奥东 on 16/7/16.
//  Copyright © 2016年 王奥东. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface countDownView : UIView

@property(nonatomic,strong)UIButton *topImageButton;

@property(nonatomic,strong)UIButton *countDownButton;

@property(nonatomic,strong)NSTimer *timer;

-(UIView *)viewOfCountDown;
@end
