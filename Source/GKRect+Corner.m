//  Created by Pieter Omvlee on 19/09/2011.
//  Copyright (c) 2014 Bohemian Coding. All rights reserved.

#import "GKRect+Corner.h"
#import "GKRect+Edge.h"
#import "GKRect+Compare.h"
#import "GKOffset.h"
#import "GKPoint.h"

@implementation GKRect (Corner)

- (GKPoint *)pointForCorner:(GKCorner *)corner
{
  return [GKPoint pointWithPoint:GKRectPointForCorner(self.rect, corner.type)];
}

- (NSArray *)pointsForCorners:(NSArray *)corners
{
  return [corners map:^id(GKCorner *corner) {
    return [self pointForCorner:corner];
  }];
}

- (GKRect *)moveCorner:(GKCorner *)corner toPoint:(GKPoint *)point
{
  self.rect = GKRectMoveCornerToPoint(self.rect, corner.type, point.point);
  return self;
}

- (GKRect *)resizeByPuttingCorner:(GKCorner *)corner atPoint:(GKPoint *)point
{
  switch (corner.type) {
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

- (GKCorner *)closestCornerForPoint:(GKPoint *)point withMargin:(CGFloat)margin
{
  __weak id blockself = self;
  return [GKCorner firstCornerSatisfyingPredicate:^BOOL(GKCorner *corner) {
    return [[blockself pointForCorner:corner] distanceToPoint:point] < margin;
  }];
}

- (GKCorner *)closestCornerForPoint:(GKPoint *)point withMargin:(CGFloat)margin satisfyingMask:(NSUInteger)cornerMask
{
  __weak id blockSelf = self;
  return [GKCorner firstCornerSatisfyingPredicate:^BOOL(GKCorner *corner) {
    return [corner satisfiesMask:cornerMask] && [[blockSelf pointForCorner:corner] distanceToPoint:point] < margin;
  }];
}


- (GKCorner *)closestCornerForPoint:(GKPoint *)point marginCallback:(BCCornerOffsetCallbackBlock)marginBlock
{
  __weak id blockSelf = self;
  return [GKCorner firstCornerSatisfyingPredicate:^BOOL(GKCorner *corner) {
    GKOffset *tolerance = marginBlock(corner);
    return [[[blockSelf pointForCorner:corner] offsetToPoint:point] isSmallerThanOffset:tolerance];
  }];
}

- (GKRect *)snapToRects:(NSArray *)rects withMargin:(CGFloat)margin
{
  GKPoint *topLeft = [self pointForCorner:[GKCorner cornerWithType:GKCornerTopLeft]];
  for (GKRect *otherRect in rects)
    [topLeft snapToRect:otherRect withMargin:margin];
  [self setX:topLeft.x];
  [self setY:topLeft.y];
  
  GKPoint *bottomRight = [self pointForCorner:[GKCorner cornerWithType:GKCornerBottomRight]];
  for (GKRect *otherRect in rects)
    [bottomRight snapToRect:otherRect withMargin:margin];
  [self setMaxX:bottomRight.x];
  [self setMaxY:bottomRight.y];
  
  return self;
}

- (GKOffset *)distanceFromCornerToMid:(GKCorner *)corner
{
  GKPoint *cornerPoint = [self pointForCorner:corner];
  GKPoint *mid = [self pointForCorner:[GKCorner cornerWithType:GKCornerMid]];
  return [GKOffset offsetFromPoint:mid toPoint:cornerPoint];
}

@end
