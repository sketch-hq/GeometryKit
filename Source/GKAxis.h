//  Created by Pieter Omvlee on 20/09/2011.
//  Copyright (c) 2011 Bohemian Coding. All rights reserved.

#import "GKObjectEnum.h"

typedef enum GKAxisType : NSInteger {
  GKAxisHorizontal = 0,
  GKAxisVertical   = 1
} GKAxisType;

enum {
  GKAxisHorizontalMask = 1 << GKAxisHorizontal,
  GKAxisVerticalMask   = 1 << GKAxisVertical
};

static GKAxisType GKAxisFlip(GKAxisType axis)
{
  return (GKAxisType)!axis;
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
