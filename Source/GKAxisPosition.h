//  Created by Pieter Omvlee on 20/09/2011.
//  Copyright (c) 2011 Bohemian Coding. All rights reserved.

#import "GKObjectEnum.h"

typedef enum GKAxisPositionType : NSInteger {
  GKAxisPositionMin = 0,
  GKAxisPositionMid = 1,
  GKAxisPositionMax = 2
} GKAxisPositionType;

@interface GKAxisPosition : GKObjectEnum
@property GKAxisPositionType type;

#pragma mark - Creating Positions
+ (id)positionMin;
+ (id)positionMid;
+ (id)positionMax;
+ (id)positionWithType:(GKAxisPositionType)aType;

@end
