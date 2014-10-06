//  Created by Pieter Omvlee on 20/09/2011.
//  Copyright (c) 2014 Bohemian Coding. All rights reserved.

#import "GKObjectEnum.h"

//assuming a flipped coordinate system the following holds true
typedef enum GKCornerType : NSInteger {
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
} GKCornerType;

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
#define GKCornerMaskAll     (GKCornerTopLeftMask | GKCornerTopRightMask | GKCornerBottomLeftMask | GKCornerBottomRightMask | GKCornerMidTopMask | GKCornerMidLeftMask | GKCornerMidRightMask | GKCornerMidBottomMask)
#define GKCornerMaskCorner  (GKCornerTopLeftMask | GKCornerTopRightMask | GKCornerBottomLeftMask | GKCornerBottomRightMask)
#define GKCornerMaskMid      (GKCornerMidTopMask | GKCornerMidLeftMask | GKCornerMidRightMask | GKCornerMidBottomMask)

typedef void(^GKCornerEnumeratorBlock)(GKCornerType corner);

static inline void GKCornerEnumerate(GKCornerEnumeratorBlock block) {
  for (NSInteger corner = 0; corner<GKCornerCount; corner++)
    block((GKCornerType)corner);
}

@class GKCorner, GKEdge;

typedef void(^GKCornerEnumerator)(GKCorner *corner);
typedef BOOL(^GKCornerEnumeratorPredicate)(GKCorner *corner);

@interface GKCorner : GKObjectEnum
@property (assign, nonatomic) GKCornerType type;
#pragma mark - Creating Corners
+ (id)cornerWithType:(GKCornerType)corner;

#pragma mark - Flip
- (GKCorner *)flip;
- (GKCorner *)cornerByFlipping;
- (GKCorner *)cornerByRotating45DegreesCounterClockwise;
- (GKCorner *)cornerByRotatingByDegrees:(NSInteger)degrees;
- (GKCorner *)flipByAxisMask:(NSUInteger)mask;

#pragma mark - Querying
- (BOOL)isInCorner;
- (BOOL)isInMid;
- (BOOL)isInMidHorizontal;
- (BOOL)isInMidVertical;
- (BOOL)satisfiesMask:(NSUInteger)mask;

+ (void)enumerateCornersInBlock:(GKCornerEnumerator)enumeratorBlock;
+ (GKCorner *)firstCornerSatisfyingPredicate:(GKCornerEnumeratorPredicate)enumeratorBlock;

+ (NSArray *)allCorners;
+ (NSArray *)cornersSatisfyingPredicate:(GKCornerEnumeratorPredicate)predicate;
+ (NSArray *)cornersSatisfyingMask:(NSUInteger)mask;

- (NSUInteger)rectEdgesMask;

@end
