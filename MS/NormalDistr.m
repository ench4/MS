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

+ (double) inverseErrorFunc: (double) x
{
    double res=0;
    for (int i=0; i<300; ++i) {
        res+=[self calcCkFor:i]/(2*i+1)*pow(sqrt(M_PI)/2*x, 2*i+1);
    }
    return res;
}

+ (double) calcCkFor: (int) x
{
    static NSMutableArray* cK=nil;
    if (cK==nil)
    {
        cK=[[NSMutableArray alloc] initWithObjects:[NSNumber numberWithDouble:1.0], nil];
    }
    if (x<[cK count])
    {
        return [(NSNumber*)(cK[x]) doubleValue];
    }
    else
    {
        for (NSInteger i=[cK count]; i<=x; ++i) {
            double res=0;
            for (NSInteger j=0; j<i; ++j) {
                res+=[cK[j] doubleValue]/(j+1)/(2*j+1)*[cK[i-1-j] doubleValue];
            }
            [cK addObject:[NSNumber numberWithDouble:res]];
            //NSLog(@"sadad %f, %ld",[cK[[cK count]-1] doubleValue],[cK count]-1);
        }
    }
    return [(NSNumber*)(cK[x]) doubleValue];
}
+ (double) inverseNormalDistrFor: (double) x
{
    if (x<0 || x>1)
    {
        NSException * exc = [NSException exceptionWithName: @"distribution error" reason: @"вероятность лежит в диапазоне от 0 до 1" userInfo: nil];
        @throw exc;
    }
    return fabs(sqrt(2)*[self inverseErrorFunc:2*x-1]);
}
@end
