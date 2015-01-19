//  Created by Pieter Omvlee on 20/09/2011.
//  Copyright (c) 2014 Bohemian Coding. All rights reserved.

#import "GKRect.h"

static inline NSComparisonResult GKRectCompare(CGRect rect1, CGRect rect2, BCAxis axis) {
  CGFloat a = GKRectMinForAxis(rect1, axis);
  CGFloat b = GKRectMinForAxis(rect2, axis);

  if (a > b) return NSOrderedDescending;
  if (a < b) return NSOrderedAscending;
  else return NSOrderedSame;
}

@interface GKRect (Axis)

@end
