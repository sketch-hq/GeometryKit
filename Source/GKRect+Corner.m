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
  switch (corner) {
    case GKCornerTopLeft:
      self.x = point.x;
      self.y = point.y;
      break;
    case GKCornerTopRight:
      self.x = point.x-self.width;
      self.y = point.y;
      break;
    case GKCornerBottomLeft:
      self.x = point.x;
      self.y = point.y-self.height;
      break;
    case GKCornerBottomRight:
      self.x = point.x-self.width;
      self.y = point.y-self.height;
      break;
    case GKCornerMidTop:
      self.x = point.x-self.width/2.0;
      self.y = point.y;
      break;
    case GKCornerMidLeft:
      self.x = point.x;
      self.y = point.y-self.height/2.0;
      break;
    case GKCornerMidRight:
      self.x = point.x-self.width;
      self.y = point.y-self.height/2;
      break;
    case GKCornerMidBottom:
      self.x = point.x-self.width/2.0;
      self.y = point.y-self.height;
      break;
    case GKCornerMid:
      self.x = point.x-self.width/2.0;
      self.y = point.y-self.height/2.0;
    default:
      break;
  }
  return self;
}

- (GKRect *)resizeByPuttingCorner:(GKCorner)corner atPoint:(CGPoint)point
{
  switch (corner) {
    case GKCornerTopLeft:
      [self resizeMinXTo:point.x];
      [self resizeMinYTo:point.y];
      break;
    case GKCornerTopRight:
      [self resizeMaxXTo:point.x];
      [self resizeMinYTo:point.y];
      break;
    case GKCornerBottomLeft:
      [self resizeMinXTo:point.x];
      [self resizeMaxYTo:point.y];
      break;
    case GKCornerBottomRight:
      [self resizeMaxXTo:point.x];
      [self resizeMaxYTo:point.y];
      break;
    case GKCornerMidTop:
      [self resizeMinYTo:point.y];
      break;
    case GKCornerMidLeft:
      [self resizeMinXTo:point.x];
      break;
    case GKCornerMidRight:
      [self resizeMaxXTo:point.x];
      break;
    case GKCornerMidBottom:
      [self resizeMaxYTo:point.y];
      break;
    default:
      break;
  }
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
