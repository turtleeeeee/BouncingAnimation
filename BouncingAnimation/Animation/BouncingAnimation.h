//
//  BouncingAnimation.h
//  BouncingAnimation
//
//  Created by Turtle on 2017/3/27.
//  Copyright © 2017年 Turtle. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BouncingAnimation : CAKeyframeAnimation

+ (instancetype)animationWithKeypath:(NSString *)keypath
                           fromValue:(id)fromValue
                             toValue:(id)toValue;

@end
