//  Created by Pieter Omvlee on 13/10/2011.
//  Copyright (c) 2014 Bohemian Coding. All rights reserved.

#import "GKRect.h"

@class GKPoint, GKOffset;

@interface GKRect (Point)
- (BOOL)containsPoint:(CGPoint)point;
- (BOOL)containsPoint:(CGPoint)point withInsetMargin:(CGFloat)rectInset;
- (CGSize)innerOffsetOfPoint:(CGPoint)point;
- (GKRect *)moveToPoint:(CGPoint)point withOffset:(CGSize)offset;
@end
