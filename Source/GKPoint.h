//  Created by Pieter Omvlee on 20/09/2011.
//  Copyright (c) 2014 Bohemian Coding. All rights reserved.

#import <Foundation/Foundation.h>

#import "GKCorner.h"
#import "GKRect+Corner.h"
#import "GKLine.h"

static inline CGSize BCPointOffsetToPoint(CGPoint me, CGPoint otherPoint) {
  return CGSizeMake(me.x - otherPoint.x, me.y - otherPoint.y);
}

static inline BOOL BCPointCanSnapToPoint(NSPoint point, NSPoint other, CGFloat margin) {
  return ABS(point.x - other.x) < margin || ABS(point.y - other.y) < margin;
}

static inline CGPoint BCPointSnapToPointWithMargin(CGPoint me, CGPoint other, CGFloat margin) {
  if (ABS(me.x - other.x) < margin)
    me.x = other.x;
  if (ABS(me.y - other.y) < margin)
    me.y = other.y;
  return me;
}

static inline CGPoint BCPointSnapToRectWithMargin(CGPoint point, CGRect rect, CGFloat margin) {
  CGPoint __block result = point;
  GKCornerEnumerate(^(GKCorner corner) {
    result = BCPointSnapToPointWithMargin(result, GKRectPointForCorner(rect, corner), margin);
  });
  return result;
}

static inline CGPoint BCPointSnapToLinesWithMargin(CGPoint point, NSArray *lines, CGFloat margin) {
  BCAxis axis = BCAxisFlip([(GKLine *)[lines firstObject] axis]);
  
  CGFloat position = GKPointPositionForAxis(point, axis);
  NSArray *sortedLines = [GKLine sortLines:lines byDistanceToValue:position];
  GKLine *line = [sortedLines firstObject];
  
  if (ABS(position - line.position) < margin)
    point = GKPointWithPositionForAxis(point, axis, line.position);
  
  return point;
}

static inline NSPoint BCPointSnapToPoint(NSPoint point, NSPoint other, CGFloat margin) {
  if (ABS(point.x - other.x) < margin)
    point.x = other.x;
  if (ABS(point.y - other.y) < margin)
    point.y = other.y;
  return point;
}
