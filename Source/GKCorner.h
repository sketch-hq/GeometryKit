//  Created by Pieter Omvlee on 20/09/2011.
//  Copyright (c) 2014 Bohemian Coding. All rights reserved.

#import "GKObjectEnum.h"
#import "GKEdge.h"

//assuming a flipped coordinate system the following holds true
typedef NS_ENUM(NSInteger, GKCorner) {
  GKCornerNone        = -1,
  GKCornerTopLeft     = 0,
  GKCornerTopRight    = 1,
  GKCornerBottomLeft  = 2,
  GKCornerBottomRight = 3,
  GKCornerMidTop      = 4,
  GKCornerMidLeft     = 5,
  GKCornerMidRight    = 6,
  GKCornerMidBottom   = 7,
  
  //not counting when enumerating
  GKCornerMid         = 8
};

enum {
  GKCornerTopLeftMask     = 1 << GKCornerTopLeft,
  GKCornerTopRightMask    = 1 << GKCornerTopRight,
  GKCornerBottomLeftMask  = 1 << GKCornerBottomLeft,
  GKCornerBottomRightMask = 1 << GKCornerBottomRight,
  GKCornerMidTopMask      = 1 << GKCornerMidTop,
  GKCornerMidLeftMask     = 1 << GKCornerMidLeft,
  GKCornerMidRightMask    = 1 << GKCornerMidRight,
  GKCornerMidBottomMask   = 1 << GKCornerMidBottom
};

#define GKCornerCount 8
#define GKCornerMaskAll    (GKCornerTopLeftMask | GKCornerTopRightMask | GKCornerBottomLeftMask | GKCornerBottomRightMask | GKCornerMidTopMask | GKCornerMidLeftMask | GKCornerMidRightMask | GKCornerMidBottomMask)
#define GKCornerMaskCorner (GKCornerTopLeftMask | GKCornerTopRightMask | GKCornerBottomLeftMask | GKCornerBottomRightMask)
#define GKCornerMaskMid    (GKCornerMidTopMask | GKCornerMidLeftMask | GKCornerMidRightMask | GKCornerMidBottomMask)

typedef void(^GKCornerEnumeratorBlock)(GKCorner corner);

static inline void GKCornerEnumerate(GKCornerEnumeratorBlock block) {
  for (NSInteger corner = 0; corner<GKCornerCount; corner++)
    block((GKCorner)corner);
}

static inline GKCorner BCCornerByRotating45DegreesCounterClockwise(GKCorner corner) {
  switch (corner) {
    case GKCornerTopLeft:     return GKCornerMidLeft;
    case GKCornerTopRight:    return GKCornerMidTop;
    case GKCornerBottomLeft:  return GKCornerMidBottom;
    case GKCornerBottomRight: return GKCornerMidRight;
    case GKCornerMidTop:      return GKCornerTopLeft;
    case GKCornerMidLeft:     return GKCornerBottomLeft;
    case GKCornerMidRight:    return GKCornerTopRight;
    case GKCornerMidBottom:   return GKCornerBottomRight;
    default:                  return GKCornerMid;
  }
}

static inline GKCorner BCCornerByRotatingByDegrees(GKCorner corner, CGFloat degrees) {
  if (degrees < 45.0/2 && degrees > -45.0/2)
    return corner;
  else {
    corner = BCCornerByRotating45DegreesCounterClockwise(corner);
    if (degrees < 0)
      return BCCornerByRotatingByDegrees(corner, degrees+45);
    else
      return BCCornerByRotatingByDegrees(corner, degrees-45);
  }
}

static inline GKCorner GKCornerFlip(GKCorner corner) {
  NSUInteger number = corner;
  if (number < GKCornerMidTop)
    number = GKCornerBottomRight - number;
  else
    number = 11- number;

  return (GKCorner) number;
}

static inline BOOL GKCornerSatisfiesMask(GKCorner corner, NSUInteger mask) {
  NSUInteger shifted = (NSUInteger) (1 << (NSUInteger)corner);
  return (mask & shifted) == shifted;
}

static inline BOOL GKCornerIsInMidHorizontal(GKCorner corner) {
  return corner == GKCornerMidLeft || corner == GKCornerMidRight;
}

static inline BOOL GKCornerIsInMidVertical(GKCorner corner) {
return corner == GKCornerMidTop || corner == GKCornerMidBottom;
}

static inline GKCorner GKCornerFlipByAxis(GKCorner corner, BCAxis axis) {
  if (axis == BCAxisHorizontal) {
    switch (corner) {
      case GKCornerTopLeft:
        return GKCornerTopRight;
      case GKCornerTopRight:
        return GKCornerTopLeft;
      case GKCornerBottomLeft:
        return GKCornerBottomRight;
      case GKCornerBottomRight:
        return GKCornerBottomLeft;
      case GKCornerMidLeft:
        return GKCornerMidRight;
      case GKCornerMidRight:
        return GKCornerMidLeft;
      default:
        break;
    }
  } else {
    switch (corner) {
      case GKCornerTopLeft:
        return GKCornerBottomLeft;
      case GKCornerTopRight:
        return GKCornerBottomRight;
      case GKCornerBottomLeft:
        return GKCornerTopLeft;
      case GKCornerBottomRight:
        return GKCornerTopRight;
      case GKCornerMidTop:
        return GKCornerMidBottom;
      case GKCornerMidBottom:
        return GKCornerMidTop;
      default:
        break;
    }
  }
  return corner;
}

static inline NSUInteger GKCornerRectEdgesMask(GKCorner type) {
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

typedef BOOL(^GKCornerEnumeratorPredicate)(GKCorner corner);

static inline GKCorner GKCornerFirstCornerSatisfyingPredicate(GKCornerEnumeratorPredicate block) {
  for (NSInteger corner = 0; corner<GKCornerCount; corner++) {
    if (block((GKCorner)corner))
      return (GKCorner)corner;
  }
  return GKCornerNone;
}
