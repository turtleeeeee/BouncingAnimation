//
//  BouncingAnimation.m
//  BouncingAnimation
//
//  Created by Turtle on 2017/3/27.
//  Copyright © 2017年 Turtle. All rights reserved.
//

#import "BouncingAnimation.h"

@implementation BouncingAnimation

+ (instancetype)animationWithKeypath:(NSString *)keypath fromValue:(id)fromValue toValue:(id)toValue
{
    BouncingAnimation *anim = [BouncingAnimation animationWithKeyPath:keypath];
    
    return anim;
}

@end
