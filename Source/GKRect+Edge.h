//  Created by Pieter Omvlee on 19/09/2011.
//  Copyright (c) 2014 Bohemian Coding. All rights reserved.

#import "GKRect.h"
#import "GKEdge.h"
#import "GKCorner.h"

@interface GKRect (Basics)
@property CGFloat minX, maxX, minY, maxY;
@property (nonatomic, readonly) CGFloat midX, midY;
@property (nonatomic) NSPoint mid;

@end

static inline CGRect GKRectResizeMinXTo(CGRect rect, CGFloat minX) {
  rect.size.width = CGRectGetMaxX(rect) - minX;
  rect.origin.x = minX;
  return rect;
}

static inline CGRect GKRectResizeMaxXTo(CGRect rect, CGFloat maxX) {
  rect.size.width = maxX - rect.origin.x;
  return rect;
}

static inline CGRect GKRectResizeMinYTo(CGRect rect, CGFloat minY) {
  rect.size.height = CGRectGetMaxY(rect) - minY;
  rect.origin.y = minY;
  return rect;
}

static inline CGRect GKRectResizeMaxYTo(CGRect rect, CGFloat maxY) {
  rect.size.height = maxY - rect.origin.y;
  return rect;
}

static inline CGRect GKRectResizeByPuttingCorner(CGRect rect, GKCorner corner, CGPoint point) {
  switch (corner) {
    case GKCornerTopLeft: {
      rect = GKRectResizeMinXTo(rect, point.x);
      rect = GKRectResizeMinYTo(rect, point.y);
      break;
    }
    case GKCornerTopRight: {
      rect = GKRectResizeMaxXTo(rect, point.x);
      rect = GKRectResizeMinYTo(rect, point.y);
      break;
    }
    case GKCornerBottomLeft: {
      rect = GKRectResizeMinXTo(rect, point.x);
      rect = GKRectResizeMaxYTo(rect, point.y);
      break;
    }
    case GKCornerBottomRight: {
      rect = GKRectResizeMaxXTo(rect, point.x);
      rect = GKRectResizeMaxYTo(rect, point.y);
      break;
    }
    case GKCornerMidTop: {
      rect = GKRectResizeMinYTo(rect, point.y);
      break;
    }
    case GKCornerMidLeft: {
      rect = GKRectResizeMinXTo(rect, point.x);
      break;
    }
    case GKCornerMidRight: {
      rect = GKRectResizeMaxXTo(rect, point.x);
      break;
    }
    case GKCornerMidBottom: {
      rect = GKRectResizeMaxYTo(rect, point.y);
      break;
    }
    default:
      break;
  }
  return rect;
}

static inline CGRect GKRectMoveToCorner(CGRect rect, GKCorner corner, CGPoint point) {
  switch (corner) {
    case GKCornerTopLeft:
      rect.origin.x = point.x;
      rect.origin.y = point.y;
      break;
    case GKCornerTopRight:
      rect.origin.x  = point.x-rect.size.width;
      rect.origin.y = point.y;
      break;
    case GKCornerBottomLeft:
      rect.origin.x  = point.x;
      rect.origin.y = point.y-rect.size.height;
      break;
    case GKCornerBottomRight:
      rect.origin.x  = point.x-rect.size.width;
      rect.origin.y = point.y-rect.size.height;
      break;
    case GKCornerMidTop:
      rect.origin.x  = point.x-rect.size.width/2.0;
      rect.origin.y = point.y;
      break;
    case GKCornerMidLeft:
      rect.origin.x  = point.x;
      rect.origin.y = point.y-rect.size.height/2.0;
      break;
    case GKCornerMidRight:
      rect.origin.x  = point.x-rect.size.width;
      rect.origin.y = point.y-rect.size.height/2;
      break;
    case GKCornerMidBottom:
      rect.origin.x  = point.x-rect.size.width/2.0;
      rect.origin.y = point.y-rect.size.height;
      break;
    case GKCornerMid:
      rect.origin.x  = point.x-rect.size.width/2.0;
      rect.origin.y = point.y-rect.size.height/2.0;
    default:
      break;
  }
  return rect;
}
