//  Created by Pieter Omvlee on 19/09/2011.
//  Copyright (c) 2011 Bohemian Coding. All rights reserved.

#import "GKRect+Corner.h"
#import "GKRect+Edge.h"
#import "GKRect+Compare.h"
#import "GKOffset.h"
#import "GKPoint.h"

@implementation GKRect (Corner)

- (GKPoint *)pointForCorner:(GKCorner *)corner
{
  switch (corner.type) {
    case GKCornerTopLeft:
      return [GKPoint pointWithX:self.minX y:self.minY];
    case GKCornerTopRight:
      return [GKPoint pointWithX:self.maxX y:self.minY];
    case GKCornerBottomLeft:
      return [GKPoint pointWithX:self.minX y:self.maxY];
    case GKCornerBottomRight:
      return [GKPoint pointWithX:self.maxX y:self.maxY];
    case GKCornerMidTop:
      return [GKPoint pointWithX:self.midX y:self.minY];
    case GKCornerMidLeft:
      return [GKPoint pointWithX:self.minX y:self.midY];
    case GKCornerMidRight:
      return [GKPoint pointWithX:self.maxX y:self.midY];
    case GKCornerMidBottom:
      return [GKPoint pointWithX:self.midX y:self.maxY];
    case GKCornerMid:
      return [GKPoint pointWithX:self.midX y:self.midY];
    default:
      return [GKPoint pointWithPoint:NSZeroPoint];
  }
}

- (NSArray *)pointsForCorners:(NSArray *)corners
{
  return [corners map:^id(GKCorner *corner) {
    return [self pointForCorner:corner];
  }];
}

- (GKRect *)moveCorner:(GKCorner *)corner toPoint:(GKPoint *)point
{
  switch (corner.type) {
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
  __unsafe_unretained id blockself = self;
  return [GKCorner firstCornerSatisfyingPredicate:^BOOL(GKCorner *corner) {
    return [[blockself pointForCorner:corner] distanceToPoint:point] < margin;
  }];
}

- (GKCorner *)closestCornerForPoint:(GKPoint *)point withMargin:(CGFloat)margin satisfyingMask:(NSUInteger)cornerMask
{
  __unsafe_unretained id blockSelf = self;
  return [GKCorner firstCornerSatisfyingPredicate:^BOOL(GKCorner *corner) {
    return [corner satisfiesMask:cornerMask] && [[blockSelf pointForCorner:corner] distanceToPoint:point] < margin;
  }];
}


- (GKCorner *)closestCornerForPoint:(GKPoint *)point marginCallback:(BCCornerOffsetCallbackBlock)marginBlock
{
  __unsafe_unretained id blockSelf = self;
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
