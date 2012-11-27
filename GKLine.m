// Created by Pieter Omvlee on 10/09/2012.
// Copyright Bohemian Coding

#import "GKLine.h"
#import "GKAxis.h"
#import "GKRect.h"
#import "GKRect+Axis.h"

@implementation GKLine

+ (GKLine *)lineOnAxis:(GKAxis *)axis position:(CGFloat)position {
  GKLine *line = [[GKLine alloc] init];
  line.axis = axis;
  line.position = position;
  return [line autorelease];
}

- (BOOL)snapToRect:(GKRect *)rect {
  GKAxis *axis = [self.axis flippedAxis];
  CGFloat min = [rect minForAxis:axis];
  CGFloat max = [rect maxForAxis:axis];

  if ([self snapToPosition:min])
    return YES;
  else if ([self snapToPosition:max])
    return YES;
  else
    return NO;
}

- (BOOL)snapToPosition:(CGFloat)pos {
  if (ABS(pos - self.position) < 5) {
    self.position = pos;
    return YES;
  } else
    return NO;
}

+ (NSArray *)sortLines:(NSArray *)lines byDistanceToValue:(CGFloat)value {
  return [lines sortedArrayUsingComparator:^NSComparisonResult(GKLine *l1, GKLine *l2) {
    return [[NSNumber numberWithInteger:(NSInteger) ABS(value - [l1 position])]
            compare:[NSNumber numberWithInteger:(NSInteger) ABS(value - [l2 position])]];
  }];
}


@end