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
    CGRect bounds = [UIScreen mainScreen].bounds;
    bounds.origin.x = bounds.size.width;
    UIView *view = [[UIView alloc] initWithFrame:bounds];
    view.backgroundColor = [UIColor colorWithRed:0/255.0 green:124/255.0 blue:195/255.0 alpha:1.0];
    [self.view addSubview:view];
    _view = view;
}
- (IBAction)animateTrigger:(id)sender {
    CGFloat scrWidth = [UIScreen mainScreen].bounds.size.width;
    BouncingAnimation *anim = [BouncingAnimation animationWithKeypath:@"position.x" fromValue:[NSNumber numberWithFloat:_view.layer.position.x] toValue:[NSNumber numberWithFloat:scrWidth/2]];
    [_view.layer addAnimation:anim forKey:@""];
}

@end
