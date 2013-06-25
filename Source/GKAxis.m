//  Created by Pieter Omvlee on 20/09/2011.
//  Copyright (c) 2011 Bohemian Coding. All rights reserved.

#import "GKAxis.h"

@implementation GKAxis
@dynamic type;

#pragma mark - Creating Edges

+ (id)horizontalAxis { return [self axisWithType:GKAxisHorizontal]; }
+ (id)verticalAxis   { return [self axisWithType:GKAxisVertical]; }
+ (id)axisWithType:(GKAxisType)aType { return [[self alloc] initWithType:aType]; }

#pragma mark - Querying

- (BOOL)isHorizontal
{
  return type == GKAxisHorizontal;
}

- (BOOL)isVertical
{
  return type == GKAxisVertical;
}

#pragma mark - Flip

- (void)flip
{
  type = GKAxisFlip(type);
}

- (id)flippedAxis
{
  GKAxis *axis = [self copy];
  [axis flip];
  return axis;
}

@end
