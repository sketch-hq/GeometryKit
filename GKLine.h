// Created by Pieter Omvlee on 10/09/2012.
// Copyright Bohemian Coding

@class GKAxis;
@class GKRect;

@interface GKLine : NSObject
@property (nonatomic, copy) GKAxis *axis;
@property (nonatomic) CGFloat position;

+ (GKLine *)lineOnAxis:(GKAxis *)axis position:(CGFloat)position;
- (BOOL)snapToRect:(GKRect *)rect;

+ (NSArray *)sortLines:(NSArray *)lines byDistanceToValue:(CGFloat)value;
@end
