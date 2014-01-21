//  Created by Pieter Omvlee on 19/09/2011.
//  Copyright (c) 2014 Bohemian Coding. All rights reserved.

#import "GKEdge.h"

@implementation GKEdge
@dynamic type;

+ (id)edgeWithType:(GKEdgeType)aType
{
  return [[self alloc] initWithType:aType];
}

- (void)flip
{
  switch (type) {
    case GKEdgeLeftMask:
      type = GKEdgeRightMask;
      break;
    case GKEdgeRightMask:
      type = GKEdgeLeftMask;
      break;
    case GKEdgeTopMask:
      type = GKEdgeBottomMask;
      break;
    case GKEdgeBottomMask:
      type = GKEdgeTopMask;
      break;
    default:
      break;
  }
}

@end
