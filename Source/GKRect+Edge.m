//  Created by Pieter Omvlee on 19/09/2011.
//  Copyright (c) 2011 Bohemian Coding. All rights reserved.

#import "GKRect+Edge.h"
#import "GKCorner.h"
#import "GKEdge.h"

@implementation GKRect (Basics)
@dynamic minX, midX, maxX, minY, midY, maxY, mid;

- (CGFloat)minX { return NSMinX(self.rect); }
- (CGFloat)midX { return NSMidX(self.rect); }
- (CGFloat)maxX { return NSMaxX(self.rect); }

- (CGFloat)minY { return NSMinY(self.rect); }
- (CGFloat)midY { return NSMidY(self.rect); }
- (CGFloat)maxY { return NSMaxY(self.rect); }

- (void)setMinX:(CGFloat)minX { self.x = minX; }
- (void)setMidX:(CGFloat)midX { self.x = midX - self.width/2; }
- (void)setMaxX:(CGFloat)maxX { self.x = maxX - self.width; }

- (void)setMinY:(CGFloat)minY { self.y = minY; }
- (void)setMidY:(CGFloat)midY { self.y = midY - self.height/2; }
- (void)setMaxY:(CGFloat)maxY { self.y = maxY - self.height; }

- (void)setMid:(NSPoint)mid {
  self.midX = mid.x;
  self.midY = mid.y;
}

- (NSPoint)mid {
  return NSMakePoint(self.midX, self.midY);
}

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
