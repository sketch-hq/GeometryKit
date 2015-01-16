//  Created by Pieter Omvlee on 13/10/2011.
//  Copyright (c) 2014 Bohemian Coding. All rights reserved.

#import "GKRect+Point.h"
#import "GKRect+Expand.h"
#import "GKRect+Corner.h"
#import "GKPoint.h"
#import "GKCorner.h"

@implementation GKRect (Point)

- (BOOL)containsPoint:(CGPoint)point
{
  return NSPointInRect(point, self.rect);
}

- (BOOL)containsPoint:(CGPoint)point withInsetMargin:(CGFloat)rectInset
{
  return [[[self copy] insetBy:rectInset] containsPoint:point];
}

- (CGSize)innerOffsetOfPoint:(CGPoint)point
{
  return BCPointOffsetToPoint(point, GKRectPointForCorner(self.rect, GKCornerTopLeft));
}

- (GKRect *)moveToPoint:(CGPoint)point withOffset:(CGSize)offset
{
  self.x = point.x - offset.width;
  self.y = point.y - offset.height;
  return self;
}

@end
