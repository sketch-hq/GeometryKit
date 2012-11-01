//  Created by Pieter Omvlee on 19/09/2011.
//  Copyright (c) 2011 Bohemian Coding. All rights reserved.

#import "GKRect.h"

@class GKEdge;

@interface GKRect (Basics)
@property CGFloat minX, maxX, minY, maxY;
@property (readonly) CGFloat midX, midY;
@property (nonatomic) NSPoint mid;

- (void)resizeMinXTo:(CGFloat)maxX;
- (void)resizeMaxXTo:(CGFloat)maxX;
- (void)resizeMinYTo:(CGFloat)maxY;
- (void)resizeMaxYTo:(CGFloat)maxY;

- (CGFloat)valueForEdge:(GKEdge *)edge;
@end
