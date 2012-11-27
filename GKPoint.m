//  Created by Pieter Omvlee on 20/09/2011.
//  Copyright (c) 2011 Bohemian Coding. All rights reserved.

#import "GKPoint.h"
#import "GKOffset.h"
#import "GKRect+Corner.h"
#import "GKCorner.h"
#import "GKAxis.h"
#import "GKLine.h"

@implementation GKPoint
@synthesize point;

+ (id)pointWithPoint:(NSPoint)aPoint {
  return [[[self alloc] initWithPoint:aPoint] autorelease];
}

+ (id)pointWithX:(CGFloat)x y:(CGFloat)y {
  return [self pointWithPoint:NSMakePoint(x, y)];
}

- (id)initWithPoint:(NSPoint)aPoint {
  self = [super init];
  if (self)
    point = aPoint;
  return self;
}

@dynamic x, y;

- (CGFloat)x { return point.x; }
- (CGFloat)y { return point.y; }
- (void)setX:(CGFloat)x { point.x = x; }
- (void)setY:(CGFloat)y { point.y = y; }

#pragma mark - Default Stuff

- (id)copyWithZone:(NSZone *)zone {
  return [[[self class] alloc] initWithPoint:point];
}

- (BOOL)isEqual:(GKPoint *)object {
  return NSEqualPoints(point, object.point);
}

- (NSUInteger)hash {
  return [super hash] + [@(point.x) hash] + [@(point.y) hash];
}

- (CGFloat)distanceToPoint:(GKPoint *)otherPoint {
  return sqrt((otherPoint.x-self.x) * (otherPoint.x-self.x) + (otherPoint.y-self.y) * (otherPoint.y-self.y));
}

- (GKOffset *)offsetToPoint:(GKPoint *)otherPoint {
  return [GKOffset offsetWithSize:NSMakeSize(self.x - otherPoint.x, self.y - otherPoint.y)];
}

#pragma mark - Snapping

- (GKPoint *)snapToRect:(GKRect *)rect withMargin:(CGFloat)margin {
  __block id blockself = self;
  [GKCorner enumerateCornersInBlock:^(GKCorner *corner) {
    [blockself snapToPoint:[rect pointForCorner:corner] withMargin:margin];
  }];
  return self;
}

- (GKPoint *)snapToPoint:(GKPoint *)other withMargin:(CGFloat)margin {
  if (ABS(self.x - other.x) < margin)
    self.x = other.x;
  if (ABS(self.y - other.y) < margin)
    self.y = other.y;
  return self;
}

- (GKPoint *)snapToLines:(NSArray *)lines withMargin:(CGFloat)margin {
  GKAxis *axis = [(GKLine *)[lines firstObject] axis];
  NSArray *sortedLines = [GKLine sortLines:lines byDistanceToValue:[self positionForAxis:axis]];
  
  GKLine *line = [sortedLines firstObject];
  
  if (ABS([self positionForAxis:axis] - line.position) < margin)
    [self setPosition:line.position forAxis:axis];
  
  return self;
}

- (CGFloat)positionForAxis:(GKAxis *)axis {
  if ([axis isHorizontal])
    return self.x;
  else
    return self.y;
}

- (void)setPosition:(CGFloat)position forAxis:(GKAxis *)axis {
  if ([axis isHorizontal])
    self.x = position;
  else
    self.y = position;
}

- (NSString *)description {
  return NSStringFromPoint(point);
}

@end
