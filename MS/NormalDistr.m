//
//  NormalDistr.m
//  MS
//
//  Created by Виктор on 29.11.12.
//  Copyright (c) 2012 Виктор. All rights reserved.
//

#import "NormalDistr.h"

@implementation NormalDistr
+ (double) calcForValue:(double) x
{
    return (1+[self calcErrorFunc:(x/sqrt(2))])/2;
}

+ (double) calcErrorFunc :(double) x
{
    double mult=1.0;
    double sum=0.0;
    
    for (int i=0; i<40; ++i)
    {
        for (int j=1;  j<=i; ++j) {
            mult*=-(x*x)/j;
        }
        sum+=(mult*(x/(2*i+1)));
        mult=1;
    }
    return sum*=2/sqrt(M_PI);
}


@end
