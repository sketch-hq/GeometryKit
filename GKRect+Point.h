//  Created by Pieter Omvlee on 13/10/2011.
//  Copyright (c) 2011 Bohemian Coding. All rights reserved.

#import "GKRect.h"

@class GKPoint, GKOffset;

@interface GKRect (Point)
- (BOOL)containsPoint:(GKPoint *)point;
- (BOOL)containsPoint:(GKPoint *)point withInsetMargin:(CGFloat)rectInset;
- (GKOffset *)innerOffsetOfPoint:(GKPoint *)point;
- (GKRect *)moveToPoint:(GKPoint *)point withOffset:(GKOffset *)offset;
@end
