//  Created by Pieter Omvlee on 19/09/2011.
//  Copyright (c) 2014 Bohemian Coding. All rights reserved.

#import "GKRect.h"
#import "GKCorner.h"

static inline NSPoint GKRectPointForCorner(NSRect rect, GKCorner corner) {
  switch (corner) {
    case GKCornerTopLeft:
      return NSMakePoint(NSMinX(rect), NSMinY(rect));
    case GKCornerTopRight:
      return NSMakePoint(NSMaxX(rect), NSMinY(rect));
    case GKCornerBottomLeft:
      return NSMakePoint(NSMinX(rect), NSMaxY(rect));
    case GKCornerBottomRight:
      return NSMakePoint(NSMaxX(rect), NSMaxY(rect));
    case GKCornerMidTop:
      return NSMakePoint(NSMidX(rect), NSMinY(rect));
    case GKCornerMidLeft:
      return NSMakePoint(NSMinX(rect), NSMidY(rect));
    case GKCornerMidRight:
      return NSMakePoint(NSMaxX(rect), NSMidY(rect));
    case GKCornerMidBottom:
      return NSMakePoint(NSMidX(rect), NSMaxY(rect));
    case GKCornerMid:
      return NSMakePoint(NSMidX(rect), NSMidY(rect));
    default:
      return NSZeroPoint;
  }
}

static inline GKCorner GKRectClosestCornerForPoint(NSRect rect, CGPoint point, CGFloat margin, NSUInteger cornerMask) {
  return GKCornerFirstCornerSatisfyingPredicate(^BOOL(GKCorner corner) {
    return GKCornerSatisfiesMask(corner, cornerMask) && BCDistanceBetweenPoints(GKRectPointForCorner(rect, corner), point) < margin;
  });
}

static inline CGSize GKRectDistanceFromCornerToMid(CGRect rect, GKCorner corner) {
  CGPoint cornerPoint = GKRectPointForCorner(rect, corner);
  CGPoint mid = GKRectPointForCorner(rect, GKCornerMid);
  return CGSizeMake(mid.x-cornerPoint.x, mid.y-cornerPoint.y);
}

@interface GKRect (Corner)

@end
