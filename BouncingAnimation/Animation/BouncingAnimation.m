//
//  BouncingAnimation.m
//  BouncingAnimation
//
//  Created by Turtle on 2017/3/27.
//  Copyright © 2017年 Turtle. All rights reserved.
//

#import "BouncingAnimation.h"

#define BOUNCING_BACK_RATIO 1.0/5.0
#define BOUNCING_BACK_TIMES 3
#define DURATION 1

typedef NS_ENUM(NSUInteger, ValueType) {
    ValueTypeCGPoint,
    ValueTypeCGSize,
    ValueTypeCGRect,
    ValueTypeUnknow
};

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
    anim->_fromValue = fromValue;
    anim->_toValue = toValue;
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
    if ([_fromValue isKindOfClass:[NSNumber class]]) {
        [self __CGFloatTypeValuesCalculation];
    }
    else {
        [self __NSValueTypeCalculation];
    }
}

- (void)__setupTimingFunctions {
    CAMediaTimingFunction *accelerateTimingFunc = [CAMediaTimingFunction functionWithControlPoints:0.5 :0 :0.5 :0];
    CAMediaTimingFunction *decelerateTimingFunc = [CAMediaTimingFunction functionWithControlPoints:0 :0.5 :0 :0.5];
    NSMutableArray *timingFunctions = [NSMutableArray array];
    for (int i = 0; i < _bouncingBackTimes; ++i) {
        [timingFunctions addObject:accelerateTimingFunc];
        [timingFunctions addObject:decelerateTimingFunc];
    }
    [timingFunctions addObject:accelerateTimingFunc];
    self.timingFunctions = [timingFunctions copy];
}

#pragma mark -
#pragma mark NSNumberCalculation
- (void)__CGFloatTypeValuesCalculation {
    CGFloat fromf = [_fromValue floatValue];
    CGFloat tof = [_toValue floatValue];
    CGFloat temp = fromf - tof;
    NSMutableArray *values = [NSMutableArray array];
    for (int i = 0; i < _bouncingBackTimes; ++i) {
        temp *= _bouncingBackRatio;
        CGFloat completedTemp = temp + tof;
        [values addObject:[NSNumber numberWithFloat:completedTemp]];
    }
    [values insertObject:[NSNumber numberWithFloat:fromf] atIndex:0];
    
    {//在values的所有值之间插入一个终点值tof
        NSMutableArray *completedValues = [NSMutableArray array];
        for (int i = 0; i < values.count; ++i) {
            [completedValues addObject:values[i]];
            [completedValues addObject:[NSNumber numberWithFloat:tof]];
        }
        values = completedValues;
    }
    
    self.values = [values copy];
}

#pragma mark -
#pragma mark NSValueCalculation
- (void)__NSValueTypeCalculation {
    ValueType type = [self __getTypeFromNSValue];
    
    switch (type) {
        case ValueTypeCGPoint: {
            
            break;
        }
        case ValueTypeCGSize: {
            
            break;
        }
        case ValueTypeCGRect: {
            
            break;
        }
        default: {
            NSLog(@"the type is unknown...");
            break;
        }
    }
    
}

- (ValueType)__getTypeFromNSValue {
    ValueType type;
    NSString *typeStr = [NSString stringWithUTF8String:[_fromValue objCType]];
    if ([typeStr hasPrefix:@"{CGPoint"]) {
        type = ValueTypeCGPoint;
    } else if([typeStr hasPrefix:@"{CGSize"]){
        type = ValueTypeCGSize;
    } else if([typeStr hasPrefix:@"{CGRect"]) {
        type = ValueTypeCGRect;
    } else {
        type = ValueTypeUnknow;
    }
    return type;
}

@end
