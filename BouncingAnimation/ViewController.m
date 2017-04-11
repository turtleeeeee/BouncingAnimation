//
//  ViewController.m
//  BouncingAnimation
//
//  Created by Turtle on 2017/3/27.
//  Copyright © 2017年 Turtle. All rights reserved.
//

#import "ViewController.h"
#import "BouncingAnimation.h"

@interface ViewController (){
    UIView *_view;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    CGRect bounds = CGRectMake(100, 300, 50, 50);
    UIView *view = [[UIView alloc] initWithFrame:bounds];
    view.backgroundColor = [UIColor colorWithRed:0/255.0 green:124/255.0 blue:195/255.0 alpha:1.0];
    [self.view addSubview:view];
    _view = view;
}
- (IBAction)animateTrigger:(id)sender {
//    CATransform3D fromt = CATransform3DIdentity;
//    CATransform3D tot = CATransform3DMakeScale(2, 2, 1);
    
//    CGFloat fromf = _view.layer.position.x;
//    CGFloat tof = fromf - _view.bounds.size.width;
    
    CGRect fromr = _view.layer.frame;
    CGRect tor = CGRectInset(fromr, 10, 10);
    
    BouncingAnimation *anim = [BouncingAnimation animationWithKeypath:@"bounds"
                                                            fromValue:[NSValue valueWithCGRect:fromr]
                                                              toValue:[NSValue valueWithCGRect:tor]];
    [_view.layer addAnimation:anim forKey:@""];
    
}

@end
