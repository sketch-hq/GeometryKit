//  Created by Pieter Omvlee on 19/09/2011.
//  Copyright (c) 2014 Bohemian Coding. All rights reserved.

#import "GKRect.h"
#import "GKCorner.h"

@class GKPoint, GKOffset;

typedef GKOffset *(^BCCornerOffsetCallbackBlock)(GKCorner *corner);

@interface GKRect (Corner)
- (GKPoint *)pointForCorner:(GKCorner *)corner;
- (NSArray *)pointsForCorners:(NSArray *)corners;

- (GKRect *)moveCorner:(GKCorner *)corner toPoint:(GKPoint *)point;
- (GKRect *)resizeByPuttingCorner:(GKCorner *)corner atPoint:(GKPoint *)point;
- (GKCorner *)closestCornerForPoint:(GKPoint *)point withMargin:(CGFloat)margin;
- (GKCorner *)closestCornerForPoint:(GKPoint *)point withMargin:(CGFloat)margin satisfyingMask:(NSUInteger)cornerMask;
- (GKCorner *)closestCornerForPoint:(GKPoint *)point marginCallback:(BCCornerOffsetCallbackBlock)marginBlock;
- (GKRect *)snapToRects:(NSArray *)rects withMargin:(CGFloat)margin;

- (GKOffset *)distanceFromCornerToMid:(GKCorner *)corner;
@end
