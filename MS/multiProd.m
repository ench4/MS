//
//  multiProd.m
//  MS
//
//  Created by Виктор on 07.12.12.
//  Copyright (c) 2012 Виктор. All rights reserved.
//

#import "multiProd.h"


@implementation multiProd
-(id) init
{
    self=[super init];
    if (self){
        products=[[NSMutableArray alloc] init];
        
        
    }
    return self;
}

-(float)capacity//
{
    float sum=0;
    for (int i=0;i<[products count];i++) {
        sum+=[(OneProd*)[products objectAtIndex:i] calcCapacity] ;
    }
    printf("%f \n",sum);
    return sum;
}
-(float) deltaWithLambda:(float) lambda//разница между занимаемым местоми размером склада
{
    float sum=0;
    for (int i=0;i<[products count];i++) {
        sum+=[(OneProd*)[products objectAtIndex:i] capacityWithLambda:lambda] ;
    }
    printf("%f \n",sum);
    return sum-warehouseSize;
}
-(void) doAll//изменяет размер заказа, чтобы он вместился на склад
{
    if ([self capacity]<warehouseSize)
    {
        return;
    }else
    {
        float lambda=0;
        printf("%----- f \n",[self deltaWithLambda:lambda]);
        while ([self deltaWithLambda:lambda]*[self deltaWithLambda:lambda-1]>0) {
            lambda-=10000;
            //printf("%f  \n",lambda);
        }
        lambda=[self secantMethodFrom:/*lambda-1*/0 To:/*lambda*/-1234567 WithEps:0.001];
                NSLog(@"%f ",[self deltaWithLambda:lambda]);
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
-(void) makeCalc
{
    for (int i=0; i<[products count]; ++i) {
        [products[i] optimal];
    }
    [self doAll];
    [self calcTCU];
}
-(NSString*) description
{
    [self makeCalc];
    
    
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
@synthesize warehouseSize=warehouseSize;
@synthesize products=products;
@end
