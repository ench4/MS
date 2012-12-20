//
//  model4.m
//  MS
//
//  Created by Виктор on 11.12.12.
//  Copyright (c) 2012 Виктор. All rights reserved.
//

#import "Model4.h"

@implementation Model4

@synthesize D=D;
@synthesize K=K;
@synthesize h=h;
@synthesize L=L;
@synthesize p=p;


-(BOOL) check
{
    double y1=sqrt(2*D*(K+p*fabs((range1-range2)/2))/h);
    double y2=p*D/h;
    //NSLog(@"y1 %f y2 %f\n",y1,y2);
    if (y1>=y2)
        return false;
    else
        return true;
}
-(float) caclC;
{
    return c=fabs(range2-range1);
}

-(void) setRange1:(float)x
{
    range1=x;
    [self caclC];
}
-(float) range1
{
    return range1;
}
-(void) setRange2:(float)x
{
    range2=x;
    [self caclC];
}
-(float) range2
{
    return range2;
}

-(float) findY
{
    if (![self check])
    {
        NSException* exc=[NSException exceptionWithName:@"error" reason:@"Решения не существует"  userInfo:nil];
        @throw exc;
    }
    else
    {
        y=sqrt(2*K*D/h);
        R=0;
        double R1;
        
        while (true) {
            R1=range2-(h*y*c)/(p*D);
            //NSLog(@"%f %f\n",R,y);
            NSLog(@"y %f r %f \n",y,R1);
            if (fabs(R-R1)<0.01)
                break;
            else
            {
                double S=range2*range2/2/c-R1*range2/c+R1*R1/2/c;
                printf("%f\n",S);
                y=sqrt(2*D*(K+p*S)/h);
                R=R1;
            }
        }
        
        return y;
    }
}
-(NSString*) description
{
    if (![self check]){
        return @"не удовлетворяет условию\n";
    }
    else
    {
        [self findY];
        return [NSString stringWithFormat:@"Заказать %f ед., как только уровень запаса уменьшится до %f ед.\n",y,R];

    }
}
@end
