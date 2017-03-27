//
//  BouncingAnimation.m
//  BouncingAnimation
//
//  Created by Turtle on 2017/3/27.
//  Copyright © 2017年 Turtle. All rights reserved.
//

#import "BouncingAnimation.h"

#define BOUNCING_BACK_RATIO 1.0/3.0
#define BOUNCING_BACK_TIMES 4
#define DURATION 0.8

@interface BouncingAnimation ()



@end

@implementation BouncingAnimation{
    BOOL _useDefaults;
}

#pragma mark -
#pragma mark Inheritance
- (instancetype)init {
    self = [super init];
    if (self) {
        _useDefaults = true;
    }
    return self;
}

#pragma mark -
#pragma mark Publics
+ (instancetype)animationWithKeypath:(NSString *)keypath
                           fromValue:(id)fromValue
                             toValue:(id)toValue
{
    BouncingAnimation *anim = [self animationWithKeypath:keypath fromValue:fromValue toValue:toValue bouncingBackRatio:0 bouncingBackTimes:0];
    return anim;
}

+ (instancetype)animationWithKeypath:(NSString *)keypath
                           fromValue:(id)fromValue
                             toValue:(id)toValue
                   bouncingBackRatio:(CGFloat)ratio
                   bouncingBackTimes:(NSInteger)times
{
    BouncingAnimation *anim = [self animationWithKeyPath:keypath];
    if (ratio == 0 || times == 0) {
        anim->_useDefaults = YES;
        anim->_bouncingBackRatio = BOUNCING_BACK_RATIO;
        anim->_bouncingBackTimes = BOUNCING_BACK_TIMES;
    }
    anim.removedOnCompletion = NO;
    anim.fillMode = kCAFillModeForwards;
    [anim __doAllTheCalculations];
    anim.duration = DURATION;
    return anim;
}

#pragma mark -
#pragma mark Accessors
- (void)setFromValue:(id)fromValue {
    _fromValue = fromValue;
    [self __doAllTheCalculations];
}

- (void)setToValue:(id)toValue {
    _toValue = toValue;
    [self __doAllTheCalculations];
}

- (void)setBouncingBackRatio:(CGFloat)bouncingBackRatio {
    _bouncingBackRatio = bouncingBackRatio;
    [self __doAllTheCalculations];
}

- (void)setBouncingBackTimes:(NSInteger)bouncingBackTimes {
    _bouncingBackTimes = bouncingBackTimes;
    [self __doAllTheCalculations];
}

#pragma mark -
#pragma mark Private Calculation
- (void)__doAllTheCalculations {
    [self __setupBouncingValues];
    [self __setupTimingFunctions];
}

- (void)__setupBouncingValues {
    
}

- (void)__setupTimingFunctions {
    
}

@end
