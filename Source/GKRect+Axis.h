//  Created by Pieter Omvlee on 20/09/2011.
//  Copyright (c) 2014 Bohemian Coding. All rights reserved.

#import "GKRect.h"

@class BCAxisPosition;

@interface GKRect (Axis)
- (CGFloat)minForAxis:(BCAxis)axis;
- (CGFloat)midForAxis:(BCAxis)axis;
- (CGFloat)maxForAxis:(BCAxis)axis;
- (CGFloat)sizeForAxis:(BCAxis)axis;

- (GKRect *)setMin:(CGFloat)value forAxis:(BCAxis)axis;
- (GKRect *)setMid:(CGFloat)value forAxis:(BCAxis)axis;
- (GKRect *)setMax:(CGFloat)value forAxis:(BCAxis)axis;
- (GKRect *)setSize:(CGFloat)value forAxis:(BCAxis)axis;

+ (NSComparisonResult)compareRect:(GKRect *)rect1 andRect:(GKRect *)rect2 forAxis:(BCAxis)axis;
@end
