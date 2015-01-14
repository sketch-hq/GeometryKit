//  Created by Pieter Omvlee on 19/09/2011.
//  Copyright (c) 2014 Bohemian Coding. All rights reserved.

#import "GKRect.h"
#import "GKCorner.h"

@class GKPoint, GKOffset;

typedef GKOffset *(^BCCornerOffsetCallbackBlock)(GKCorner *corner);

static inline NSPoint GKRectPointForCorner(NSRect rect, GKCornerType corner) {
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
};

static inline NSRect GKRectMoveCornerToPoint(NSRect rect, GKCornerType corner, NSPoint point) {
  switch (corner) {
    case GKCornerTopLeft:
      rect.origin.x = point.x;
      rect.origin.y = point.y;
      break;
    case GKCornerTopRight:
      rect.origin.x = point.x-rect.size.width;
      rect.origin.y = point.y;
      break;
    case GKCornerBottomLeft:
      rect.origin.x = point.x;
      rect.origin.y = point.y-rect.size.height;
      break;
    case GKCornerBottomRight:
      rect.origin.x = point.x-rect.size.width;
      rect.origin.y = point.y-rect.size.height;
      break;
    case GKCornerMidTop:
      rect.origin.x = point.x-rect.size.width/2.0;
      rect.origin.y = point.y;
      break;
    case GKCornerMidLeft:
      rect.origin.x = point.x;
      rect.origin.y = point.y-rect.size.height/2.0;
      break;
    case GKCornerMidRight:
      rect.origin.x = point.x-rect.size.width;
      rect.origin.y = point.y-rect.size.height/2;
      break;
    case GKCornerMidBottom:
      rect.origin.x = point.x-rect.size.width/2.0;
      rect.origin.y = point.y-rect.size.height;
      break;
    case GKCornerMid:
      rect.origin.x = point.x-rect.size.width/2.0;
      rect.origin.y = point.y-rect.size.height/2.0;
    default:
      break;
  }
  return rect;
}


@interface GKRect (Corner)
- (GKPoint *)pointForCorner:(GKCorner *)corner;
- (NSArray *)pointsForCorners:(NSArray *)corners;

- (GKRect *)moveCorner:(GKCorner *)corner toPoint:(GKPoint *)point;
- (GKRect *)resizeByPuttingCorner:(GKCorner *)corner atPoint:(GKPoint *)point;
- (GKCorner *)closestCornerForPoint:(GKPoint *)point withMargin:(CGFloat)margin;
- (GKCorner *)closestCornerForPoint:(GKPoint *)point withMargin:(CGFloat)margin satisfyingMask:(NSUInteger)cornerMask;
- (GKCorner *)closestCornerForPoint:(GKPoint *)point marginCallback:(BCCornerOffsetCallbackBlock)marginBlock;
- (GKRect *)snapToRects:(NSArray *)rects withMargin:(CGFloat)margin;

- (GKOffset *)distanceFromCornerToMid:(GKCorner *)corner;
@end
