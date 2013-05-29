//  Created by Pieter Omvlee on 19/09/2011.
//  Copyright (c) 2011 Bohemian Coding. All rights reserved.

#import "GKRect.h"

@interface GKRect (Expand)
- (GKRect *)expandBy:(CGFloat)offset;
- (GKRect *)expandXBy:(CGFloat)xOffset yBy:(CGFloat)yOffset;

- (GKRect *)insetBy:(CGFloat)inset;
- (GKRect *)insetXBy:(CGFloat)xInset yBy:(CGFloat)yInset;

- (GKRect *)moveBy:(NSSize)offset;
@end
