// Created by Pieter Omvlee on 10/09/2012.
// Copyright Bohemian Coding

#import "GKLine.h"
#import "GKRect.h"
#import "GKRect+Axis.h"

@implementation GKLine

+ (GKLine *)lineOnAxis:(BCAxis)axis position:(CGFloat)position {
  GKLine *line = [[GKLine alloc] init];
  line.axis = axis;
  line.position = position;
  return line;
}

@end
