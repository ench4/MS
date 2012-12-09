//
//  randOneProd.m
//  MS
//
//  Created by Samez on 09.12.12.
//  Copyright (c) 2012 Виктор. All rights reserved.
//

#import "randOneProd.h"
#import "NormalDistr.h"

@implementation randOneProd

@synthesize D=D;
@synthesize K=K;
@synthesize h=h;
@synthesize L=L;
@synthesize alpha=alpha;
@synthesize sigma=sigma;

-(id)init
{
    self=[super init];
    if(self)
    {
        yOpt=0;
    }
    return self;
}

-(float) optimal
{
    return yOpt=sqrt(2*K*D/h);
}

-(float) calcPeriod
{
    T=yOpt/D;
    if (T<L){
        T=L-T*((int)L/T);
    }
    return T;
}

-(float) orderPoint
{
    return orderPoint=D*T;
}

-(float) calcB
{
    double B=0;
    B=[NormalDistr inverseNormalDistrFor:alpha]*sqrt(sigma*sigma*T);
    B=((int)B)+1;//плохо
    return B;
}

- (NSString*) description
{
    return [NSString stringWithFormat:@"При экономичном размере заказа у* = %f единиц оптимальная политика управления запасами с объемом резерва В=%f состоит в заказе %f ламп, как только объем запаса уменьшается до %f единиц.\n",yOpt,[self calcB],yOpt,(int)orderPoint+[self calcB]];
}


@end
