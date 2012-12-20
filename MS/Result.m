//
//  Result.m
//  MS
//
//  Created by Виктор on 29.11.12.
//  Copyright (c) 2012 Виктор. All rights reserved.
//

#import "Result.h"

@implementation Result
@synthesize x1;
@synthesize x2;
-(id)initWithX:(float)x11 andX2:(float)x22
{
    self=[self init];
    if (self)
    {
        x1=x11;
        x2=x22;
    }
    return self;
}
@end

Result* sqr(float a,float b,float c)
{
    float D=b*b-4*a*c;
    if (D<0) return nil;
    else {
        Result* res=[[Result alloc] init];
        res.x1=(-b+sqrt(D)/2*a);
        res.x2=(-b-sqrt(D)/2*a);
        return res;
    }
}