//  Created by Pieter Omvlee on 19/09/2011.
//  Copyright (c) 2011 Bohemian Coding. All rights reserved.

#import "GKRect.h"

@interface GKRect (Relative)
- (GKRect *)relativeRectInsideRect:(GKRect *)outerRect;
- (GKRect *)absoluteRectInsideRect:(GKRect *)outerRect;

- (void)translateFromRect:(GKRect *)outerRect1 toRect:(GKRect *)outerRect2;
@end
