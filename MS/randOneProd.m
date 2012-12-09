//
//  randOneProd.m
//  MS
//
//  Created by Samez on 09.12.12.
//  Copyright (c) 2012 Виктор. All rights reserved.
//

#import "randOneProd.h"

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
    return yOpt=sqrtf(2*K*D/h);
}

-(float) calcPeriod
{
    T=yOpt/D;
    if (T<L){
        T=L-T*((int)L/T);
    }
    return T;
}

-(float) calcMu
{
    return mu=D*L;
}

-(float) calcB
{
    float sigmaL=sigma*sqrtf(L);
    
}



@end
