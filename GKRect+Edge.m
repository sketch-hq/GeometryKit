//  Created by Pieter Omvlee on 19/09/2011.
//  Copyright (c) 2011 Bohemian Coding. All rights reserved.

#import "GKRect+Edge.h"
#import "GKCorner.h"
#import "GKEdge.h"

@implementation GKRect (Basics)
@dynamic minX, midX, maxX, minY, midY, maxY;

- (CGFloat)minX { return NSMinX(rect); }
- (CGFloat)midX { return NSMidX(rect); }
- (CGFloat)maxX { return NSMaxX(rect); }

- (CGFloat)minY { return NSMinY(rect); }
- (CGFloat)midY { return NSMidY(rect); }
- (CGFloat)maxY { return NSMaxY(rect); }

- (void)setMinX:(CGFloat)minX { self.x = minX; }
- (void)setMaxX:(CGFloat)maxX { self.x = maxX - self.width; }

- (void)setMinY:(CGFloat)minY { self.y = minY; }
- (void)setMaxY:(CGFloat)maxY { self.y = maxY - self.height; }

- (void)resizeMinXTo:(CGFloat)minX
{
  self.width = self.maxX - minX;
  self.x = minX;
}

- (void)resizeMaxXTo:(CGFloat)maxX
{
  self.width = maxX - self.x;
}

- (void)resizeMinYTo:(CGFloat)minY
{
  self.height = self.maxY - minY;
  self.y = minY;
}

- (void)resizeMaxYTo:(CGFloat)maxY
{
  self.height = maxY - self.y;
}

- (CGFloat)valueForEdge:(GKEdge *)edge
{
  switch (edge.type) {
    case GKEdgeLeftMask:
      return self.minX;
    case GKEdgeMidVerticalMask:
      return self.midX;
    case GKEdgeRightMask:
      return self.maxX;
    case GKEdgeTopMask:
      return self.minY;
    case GKEdgeMidHorizontalMask:
      return self.midY;
    case GKEdgeBottomMask:
      return self.maxY;
    default:
      return 0;
  }
}

@end
