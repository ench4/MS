//
//  OneProd.m
//  MS
//
//  Created by Виктор on 29.11.12.
//  Copyright (c) 2012 Виктор. All rights reserved.
//

#import "OneProd.h"
#import "Result.h"
#import <math.h>

@implementation OneProd
@synthesize D=D;
@synthesize K=K;
@synthesize h=h;
@synthesize L=L;
@synthesize a=a;
@synthesize q=q;
@synthesize c1=c1;
@synthesize c2=c2;
@synthesize T=T;

-(float) optimal
{
    yOpt=sqrt(2*K*D/h);
    if (yOpt>q){//первая зона
        return yOpt;
    }
    else
    {
        Result* res=sqr(h/2, D*c1-D*c2-K*D/yOpt-h*yOpt/2, K*D);
        if (res==nil) return NAN;
        if (yOpt<res.x1){
            yMin=res.x1;
        }
        else if (yOpt<res.x2)
        {
            yMin=res.x2;
        }else return NAN;
        
        if (q<yMin)//2 зона
        {
            yOpt=q;
            return yOpt;
        }else{//3 зона
            return yOpt;
        }
    }
}
-(float) calcCapacity//вычисляет занимаемое место на складе
{
    return a*[self optimal];
}
-(float) capacityWithLambda:(float) lambda//вычисляет занимаемое место на складе при заданном множителе лагранжа
{
    return a*sqrt(2*K*D/(h-2*a*lambda));
}
-(float) recalcYoptWithLambda:(float)lambda//оптимальный заказ при заданном множителе лагранжа
{
    return yOpt=sqrt(2*K*D/(h-2*a*lambda));
}
-(float) calcPeriod
{
    T=yOpt/D;
    
    if (T<L){
        T=L-T*((int)(L/T));
    }
    return T;
}
-(float) orderPoint
{
    [self calcPeriod];
    //NSLog(@"%f ",T);
    NSLog(@"%f ",T*D);
    return T*D;
}
-(float) calcTCU
{
    return K*D/yOpt+h*yOpt/2;
}
-(NSString*) description
{
    return [[NSString alloc] initWithFormat:@"Необходимо заказать %f ед. 1-го товара, когда уровень запаса опустится до %f. Дневные расходы, связанные с содержанием запаса в соответствии с оптимальной стратегией равны %f руб.\n",yOpt, round([self orderPoint]),[self calcTCU]];
}
@end
