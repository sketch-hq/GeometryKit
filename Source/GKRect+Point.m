//  Created by Pieter Omvlee on 13/10/2011.
//  Copyright (c) 2014 Bohemian Coding. All rights reserved.

#import "GKRect+Point.h"
#import "GKRect+Expand.h"
#import "GKRect+Corner.h"
#import "GKPoint.h"
#import "GKCorner.h"
#import "GKOffset.h"

@implementation GKRect (Point)

- (BOOL)containsPoint:(GKPoint *)point
{
  return NSPointInRect(point.point, self.rect);
}

- (BOOL)containsPoint:(GKPoint *)point withInsetMargin:(CGFloat)rectInset
{
  return [[[self copy] insetBy:rectInset] containsPoint:point];
}

- (GKOffset *)innerOffsetOfPoint:(GKPoint *)point
{
  return [point offsetToPoint:[self pointForCorner:[GKCorner cornerWithType:GKCornerTopLeft]]];
}

- (GKRect *)moveToPoint:(GKPoint *)point withOffset:(GKOffset *)offset
{
  self.x = point.x - offset.xOffset;
  self.y = point.y - offset.yOffset;
  return self;
}

@end
