//  Created by Pieter Omvlee on 20/09/2011.
//  Copyright (c) 2014 Bohemian Coding. All rights reserved.

#import "GKObjectEnum.h"

typedef enum GKAxisType : NSInteger {
  GKAxisHorizontal = 0,
  GKAxisVertical   = 1
} GKAxisType;

enum {
  GKAxisHorizontalMask = 1 << GKAxisHorizontal,
  GKAxisVerticalMask   = 1 << GKAxisVertical
};

static inline GKAxisType GKAxisFlip(GKAxisType axis) {
  return (GKAxisType)!axis;
}

static inline CGFloat GKRectMinForAxis(NSRect rect, GKAxisType axis) {
  return axis == GKAxisHorizontal ? rect.origin.x : rect.origin.y;
}

static inline CGFloat GKRectMaxForAxis(NSRect rect, GKAxisType axis) {
  return axis == GKAxisHorizontal ? NSMaxX(rect) : NSMaxY(rect);
}

static inline CGFloat GKRectSizeForAxis(NSRect rect, GKAxisType axis) {
  return axis == GKAxisHorizontal ? rect.size.width : rect.size.height;
}

static inline CGFloat GKPointPositionForAxis(NSPoint point, GKAxisType axis) {
  if (axis == GKAxisHorizontal)
    return point.x;
  else
    return point.y;
}

@class GKRect;

@interface GKAxis : GKObjectEnum
@property GKAxisType type;

#pragma mark - Creating Edges
+ (id)horizontalAxis;
+ (id)verticalAxis;
+ (id)axisWithType:(GKAxisType)aType;

#pragma mark - Querying
- (BOOL)isHorizontal;
- (BOOL)isVertical;

#pragma mark - Flip
- (void)flip;
- (id)flippedAxis;
@end
