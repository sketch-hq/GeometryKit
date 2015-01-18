//  Created by Pieter Omvlee on 19/09/2011.
//  Copyright (c) 2014 Bohemian Coding. All rights reserved.

#import "GKRect+Corner.h"
#import "GKRect+Edge.h"
#import "GKPoint.h"

@implementation GKRect (Corner)

- (NSArray *)pointsForCorners:(NSArray *)corners
{
  return [corners map:^id(NSNumber *cornerNumber) {
    return [NSValue valueWithPoint:GKRectPointForCorner(self.rect, cornerNumber.integerValue)];
  }];
}

- (GKRect *)moveCorner:(GKCorner)corner toPoint:(CGPoint)point
{
  self.rect = GKRectMoveToCorner(self.rect, corner, point);
  return self;
}

- (GKRect *)resizeByPuttingCorner:(GKCorner)corner atPoint:(CGPoint)point
{
  self.rect = GKRectResizeByPuttingCorner(self.rect, corner, point);
  return self;
}

- (GKCorner)closestCornerForPoint:(CGPoint)point withMargin:(CGFloat)margin satisfyingMask:(NSUInteger)cornerMask
{
  return GKRectClosestCornerForPoint(self.rect, point, margin, cornerMask);
}

- (CGSize)distanceFromCornerToMid:(GKCorner)corner {
  return GKRectDistanceFromCornerToMid(self.rect, corner);
}

@end
