//  Created by Pieter Omvlee on 20/09/2011.
//  Copyright (c) 2014 Bohemian Coding. All rights reserved.

#import "GKRect.h"

@class GKAxis, GKAxisPosition;

@interface GKRect (Axis)
- (CGFloat)minForAxis:(GKAxis *)axis;
- (CGFloat)midForAxis:(GKAxis *)axis;
- (CGFloat)maxForAxis:(GKAxis *)axis;
- (CGFloat)sizeForAxis:(GKAxis *)axis;

- (GKRect *)setMin:(CGFloat)value forAxis:(GKAxis *)axis;
- (GKRect *)setMid:(CGFloat)value forAxis:(GKAxis *)axis;
- (GKRect *)setMax:(CGFloat)value forAxis:(GKAxis *)axis;
- (GKRect *)setSize:(CGFloat)value forAxis:(GKAxis *)axis;
- (GKRect *)setSize:(CGFloat)value forAxis:(GKAxis *)axis anchoredToPosition:(GKAxisPosition *)edge;

+ (NSComparisonResult)compareRect:(GKRect *)rect1 andRect:(GKRect *)rect2 forAxis:(GKAxis *)axis;
@end
