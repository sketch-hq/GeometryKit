// Created by Pieter Omvlee on 10/09/2012.
// Copyright Bohemian Coding

@class GKRect;

typedef struct _GKLineType {
  CGFloat position;
  BCAxis axis;
} GKLineType;

static inline GKLineType GKLineLineOnAxis(CGFloat position, BCAxis axis) {
  GKLineType line;
  line.position = position;
  line.axis = axis;

  return line;
}

static inline BOOL GKLineSnapToPosition(GKLineType line, CGFloat pos, CGFloat margin, CGFloat *snapped) {
  if (ABS(pos - line.position) < margin) {
    *snapped = pos;
    return YES;
  } else
    return NO;
}

static inline BOOL GKLineSnapsToRect(GKLineType line, CGRect rect, CGFloat margin, CGFloat *snapped) {
  BCAxis axis = BCAxisFlip(line.axis);
  CGFloat min = GKRectMinForAxis(rect, axis);
  CGFloat max = GKRectMaxForAxis(rect, axis);
  if (GKLineSnapToPosition(line, min, margin, snapped))
    return YES;
  else if (GKLineSnapToPosition(line, max, margin, snapped))
    return YES;
  else
    return NO;
}

@interface GKLine : NSObject
@property (nonatomic, readonly) BCAxis axis;
@property (nonatomic, readonly) CGFloat position;
+ (GKLine *)lineOnAxis:(BCAxis)axis position:(CGFloat)position;
@end

static inline NSArray* GKLineSortByDistanceToValue(NSArray *lines, CGFloat value) {
  return [lines sortedArrayUsingComparator:^NSComparisonResult(GKLine *l1, GKLine *l2) {
    return [@((NSInteger) ABS(value - l1.position)) compare:@((NSInteger) ABS(value - l2.position))];
  }];
}
