//
//  NormalDistr.h
//  MS
//
//  Created by Виктор on 29.11.12.
//  Copyright (c) 2012 Виктор. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NormalDistr : NSObject

+ (double) calcForValue:(double) x;
+ (double) calcErrorFunc :(double) x;
+ (double) inverseErrorFunc: (double) x;
+ (double) calcCkFor: (int) x;
+ (double) inverseNormalDistrFor: (double) x;
@end
