//  Created by Pieter Omvlee on 20/09/2011.
//  Copyright (c) 2014 Bohemian Coding. All rights reserved.

#import "GKRect+Axis.h"
#import "GKRect+Edge.h"
#import "GKAxis.h"
#import "GKAxisPosition.h"

@implementation GKRect (Axis)

- (CGFloat)minForAxis:(GKAxis *)axis  { return axis.type == GKAxisHorizontal ? self.minX : self.minY; }
- (CGFloat)midForAxis:(GKAxis *)axis  { return axis.type == GKAxisHorizontal ? self.midX : self.midY; }
- (CGFloat)maxForAxis:(GKAxis *)axis  { return axis.type == GKAxisHorizontal ? self.maxX : self.maxY; }
- (CGFloat)sizeForAxis:(GKAxis *)axis { return axis.type == GKAxisHorizontal ? self.width : self.height; }

- (GKRect *)setMin:(CGFloat)value forAxis:(GKAxis *)axis
{
  if (axis.type == GKAxisHorizontal)
    self.x = value;
  else
    self.y = value;
  return self;
}

- (GKRect *)setMid:(CGFloat)value forAxis:(GKAxis *)axis
{
  if (axis.type == GKAxisHorizontal)
    self.x = value - self.width/2;
  else
    self.y = value - self.height/2;
  return self;
}

- (GKRect *)setMax:(CGFloat)value forAxis:(GKAxis *)axis
{
  if (axis.type == GKAxisHorizontal)
    self.x = value - self.width;
  else
    self.y = value - self.height;
  return self;
}

- (GKRect *)setSize:(CGFloat)value forAxis:(GKAxis *)axis
{
  if (axis.type == GKAxisHorizontal)
    self.width = value;
  else
    self.height = value;
  return self;
}

+ (NSComparisonResult)compareRect:(GKRect *)rect1 andRect:(GKRect *)rect2 forAxis:(GKAxis *)axis {
  CGFloat a = [rect1 minForAxis:axis];
  CGFloat b = [rect2 minForAxis:axis];

  if (a > b) return NSOrderedDescending;
  if (a < b) return NSOrderedAscending;
  else return NSOrderedSame;
}

@end
