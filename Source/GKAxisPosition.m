//  Created by Pieter Omvlee on 20/09/2011.
//  Copyright (c) 2011 Bohemian Coding. All rights reserved.

#import "GKAxisPosition.h"

@implementation GKAxisPosition
@dynamic type;

#pragma mark - Creating Positions

+ (id)positionMin { return [self positionWithType:GKAxisPositionMin]; };
+ (id)positionMid { return [self positionWithType:GKAxisPositionMid]; };
+ (id)positionMax { return [self positionWithType:GKAxisPositionMax]; };

+ (id)positionWithType:(GKAxisPositionType)aType
{
  return [[self alloc] initWithType:aType];
}

@end
