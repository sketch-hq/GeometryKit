//  Created by Pieter Omvlee on 20/09/2011.
//  Copyright (c) 2014 Bohemian Coding. All rights reserved.

@interface GKObjectEnum : NSObject <NSCopying>
{
  NSInteger type;
}
- (id)initWithType:(NSInteger)aType;
- (NSString *)stringRepresentation;
@end
