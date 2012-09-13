//  Created by Pieter Omvlee on 20/09/2011.
//  Copyright (c) 2011 Bohemian Coding. All rights reserved.

#import "GKCorner.h"
#import "GKEdge.h"
#import "GKAxis.h"

@implementation GKCorner
@dynamic type;

#pragma mark - Creating Edges

+ (id)cornerWithType:(GKCornerType)corner
{
  return [[[self alloc] initWithType:corner] autorelease];
}

- (GKCorner *)flip
{
  if (type < 4)
    type = 3-type;
  else
    type = 11-type;
  
  return self;
}

- (GKCorner *)cornerByFlipping
{
  return [(GKCorner *)[[self copy] autorelease] flip];
}

- (GKCorner *)cornerByRotating45DegreesCounterClockwise
{
  switch (type) {
    case GKCornerTopLeft:     return [GKCorner cornerWithType:GKCornerMidLeft];
    case GKCornerTopRight:    return [GKCorner cornerWithType:GKCornerMidTop];
    case GKCornerBottomLeft:  return [GKCorner cornerWithType:GKCornerMidBottom];
    case GKCornerBottomRight: return [GKCorner cornerWithType:GKCornerMidRight];
    case GKCornerMidTop:      return [GKCorner cornerWithType:GKCornerTopLeft];
    case GKCornerMidLeft:     return [GKCorner cornerWithType:GKCornerBottomLeft];
    case GKCornerMidRight:    return [GKCorner cornerWithType:GKCornerTopRight];
    case GKCornerMidBottom:   return [GKCorner cornerWithType:GKCornerBottomRight];
    default:                  return [GKCorner cornerWithType:GKCornerMid];
  }
}

- (GKCorner *)cornerByRotatingByDegrees:(NSInteger)degrees
{
  if (degrees < 45.0/2 && degrees > -45.0/2)
    return [[self copy] autorelease];
  else if (degrees < 0)
    return [[self cornerByRotating45DegreesCounterClockwise] cornerByRotatingByDegrees:degrees+45];
  else
    return [[self cornerByRotating45DegreesCounterClockwise] cornerByRotatingByDegrees:degrees-45];
}

- (GKCorner *)flipByAxisMask:(NSUInteger)mask
{
  if ((mask & GKAxisHorizontalMask)) {
    switch (type) {
      case GKCornerTopLeft:
        self.type = GKCornerTopRight;
        break;
      case GKCornerTopRight:
        self.type = GKCornerTopLeft;
        break;
      case GKCornerBottomLeft:
        self.type = GKCornerBottomRight;
        break;
      case GKCornerBottomRight:
        self.type = GKCornerBottomLeft;
        break;
      case GKCornerMidLeft:
        self.type = GKCornerMidRight;
        break;
      case GKCornerMidRight:
        self.type = GKCornerMidLeft;
        break;
      default:
        break;
    }
  }
  
  if ((mask & GKAxisVerticalMask)) {
    switch (type) {
      case GKCornerTopLeft:
        self.type = GKCornerBottomLeft;
        break;
      case GKCornerTopRight:
        self.type = GKCornerBottomRight;
        break;
      case GKCornerBottomLeft:
        self.type = GKCornerTopLeft;
        break;
      case GKCornerBottomRight:
        self.type = GKCornerTopRight;
        break;
      case GKCornerMidTop:
        self.type = GKCornerMidBottom;
        break;
      case GKCornerMidBottom:
        self.type = GKCornerMidTop;
        break;
      default:
        break;
    }
  }
  return self;

}

#pragma mark - Querying

- (BOOL)isInCorner
{
  return [self satisfiesMask:GKCornerMaskCorner];
}

- (BOOL)isInMid
{
  return [self satisfiesMask:GKCornerMaskMid];
}

- (BOOL)isInMidHorizontal
{
  return type == GKCornerMidLeft || type == GKCornerMidRight;
}

- (BOOL)isInMidVertical
{
  return type == GKCornerMidTop || type == GKCornerMidBottom;
}

- (NSUInteger)maskValue
{
  return 1 << (NSUInteger)type;
}

- (BOOL)satisfiesMask:(NSUInteger)mask
{
  return (mask & [self maskValue]) == [self maskValue];
}

+ (void)enumerateCornersInBlock:(GKCornerEnumerator)enumeratorBlock
{
  for (GKCornerType corner = 0; corner<GKCornerCount; corner++)
    enumeratorBlock([GKCorner cornerWithType:corner]);
}

+ (GKCorner *)firstCornerSatisfyingPredicate:(GKCornerEnumeratorPredicate)enumeratorBlock
{
  for (GKCornerType i=0 ; i<GKCornerCount; i++) {
    GKCorner *corner = [GKCorner cornerWithType:i];
    if (enumeratorBlock(corner))
      return corner;
  }
  return [GKCorner cornerWithType:GKCornerNone];
}

+ (NSArray *)allCorners
{
  NSMutableArray *array = [NSMutableArray arrayWithCapacity:GKCornerCount];
  for (GKCornerType i=0 ; i<GKCornerCount; i++)
    [array addObject:[GKCorner cornerWithType:i]];
  
  return array;
}

+ (NSArray *)cornersSatisfyingPredicate:(GKCornerEnumeratorPredicate)predicate
{
  return [[self allCorners] filteredArrayUsingBlock:^BOOL(id object) {
    return predicate(object);
  }];
}

- (NSString *)stringRepresentation
{
  switch (type) {
    case GKCornerTopLeft:     return @"GKCornerTopLeft";
    case GKCornerTopRight:    return @"GKCornerTopRight";
    case GKCornerBottomLeft:  return @"GKCornerBottomLeft";
    case GKCornerBottomRight: return @"GKCornerBottomRight";
    case GKCornerMidTop:      return @"GKCornerMidTop";
    case GKCornerMidLeft:     return @"GKCornerMidLeft";
    case GKCornerMidRight:    return @"GKCornerMidRight";
    case GKCornerMidBottom:   return @"GKCornerMidBottom";
    case GKCornerMid:         return @"GKCornerMid";
    default: return @"GKCornerNone";
  }
}

+ (NSArray *)cornersSatisfyingMask:(NSUInteger)mask
{
  return [[self allCorners] filteredArrayUsingBlock:^BOOL(GKCorner *corner) {
    return [corner satisfiesMask:mask];
  }];
}

- (NSUInteger)rectEdgesMask
{
  switch (type) {
    case GKCornerTopLeft:
      return GKEdgeTopMask | GKEdgeLeftMask;
    case GKCornerMidTop:
      return GKEdgeTopMask;
    case GKCornerTopRight:
      return GKEdgeTopMask | GKEdgeRightMask;
    case GKCornerMidLeft:
      return GKEdgeLeftMask;
    case GKCornerMidRight:
      return GKEdgeRightMask;
    case GKCornerBottomLeft:
      return GKEdgeBottomMask | GKEdgeLeftMask;
    case GKCornerMidBottom:
      return GKEdgeBottomMask;
    case GKCornerBottomRight:
      return GKEdgeBottomMask | GKEdgeRightMask;
    default:
      return 0;
  }
}

@end
