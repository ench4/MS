//
//  multiProd.m
//  MS
//
//  Created by Виктор on 07.12.12.
//  Copyright (c) 2012 Виктор. All rights reserved.
//

#import "multiProd.h"
#import "OneProd.h"

@implementation multiProd
-(id) init
{
    self=[super init];
    if (self){
        products=[[NSMutableArray alloc] init];
    }
    return self;
}
-(float)capacity
{
    float sum=0;
    for (int i=0;i<[products count];i++) {
        sum+=[(OneProd*)[products objectAtIndex:i] calcCapacity] ;
    }
    return sum;
}
-(float) deltaWithLambda:(float) lambda
{
    float sum=0;
    for (int i=0;i<[products count];i++) {
        sum+=[(OneProd*)[products objectAtIndex:i] capacityWithLambda:lambda] ;
    }
    return sum-warehouseSize;
}
-(void) doAll
{
    if ([self capacity]<warehouseSize)
    {
        return;
    }else
    {
        float lambda=0;
        while ([self deltaWithLambda:lambda]*[self deltaWithLambda:lambda-1]>0) {
            lambda--;
        }
        lambda=[self secantMethodFrom:lambda To:lambda+1 WithEps:0.01];
        for (int i=0; i<[products count]; i++) {
            [(OneProd*)(products[i]) recalcYoptWithLambda:lambda];
        }
    }
}
-(float) calcTCU
{
    float sum=0;
    for (int i=0; i<[products count]; i++) {
        sum+=[(OneProd*)[products objectAtIndex:i] calcTCU];
    }
    return sum;
}
-(NSString*) description
{
    NSMutableString* s=[[NSMutableString alloc] init];
    for (int i=0;i<[products count];i++) {
        [s appendString:[(OneProd*)[products objectAtIndex:i] description]] ;
    }
    return s;
}
-(double) secantMethodFrom:(double) a To:(double) b WithEps:(double) eps
{
    double c=0;
    do{
        c=a-(b-a)/([self deltaWithLambda:b]-[self deltaWithLambda:a])*[self deltaWithLambda:a];
        
        if ([self deltaWithLambda:a]*[self deltaWithLambda:c]<0) b=c;
        else if ([self deltaWithLambda:b]*[self deltaWithLambda:c]<0) a=c;
        else return NAN;
    }while (fabs([self deltaWithLambda:c])>eps);
    return c;
}
@end
