//
//  BouncingAnimation.h
//  BouncingAnimation
//
//  Created by Turtle on 2017/3/27.
//  Copyright © 2017年 Turtle. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BouncingAnimation : CAKeyframeAnimation

@property (nonatomic, assign) CGFloat bouncingBackRatio;
@property (nonatomic, assign) NSInteger bouncingBackTimes;
@property (nonatomic, strong) id fromValue;
@property (nonatomic, strong) id toValue;

+ (instancetype)animationWithKeypath:(NSString *)keypath
                           fromValue:(id)fromValue
                             toValue:(id)toValue;

+ (instancetype)animationWithKeypath:(NSString *)keypath
                           fromValue:(id)fromValue
                             toValue:(id)toValue
                   bouncingBackRatio:(CGFloat)ratio
                   bouncingBackTimes:(NSInteger)times;

@end
