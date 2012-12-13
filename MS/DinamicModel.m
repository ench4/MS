//
//  DinamicModel.m
//  MS
//
//  Created by Samez on 10.12.12.
//  Copyright (c) 2012 Виктор. All rights reserved.
//

#import "DinamicModel.h"

@implementation DinamicModel

@synthesize D=D;
@synthesize K=K;
@synthesize h=h;


-(id) init
{
    self=[super init];
    if(self)
    {
        
        /*D=[[NSMutableArray alloc] initWithObjects:@14,@70,@60,@40, nil];
        h=[[NSMutableArray alloc] initWithObjects:@2,@28,@4,@14, nil];
        K=[[NSMutableArray alloc] initWithObjects:@56,@30,@28,@2, nil];*/
        
        D=[[NSMutableArray alloc] initWithObjects:@0,@4,@3,@2,@1, nil];
        h=[[NSMutableArray alloc] initWithObjects:@0,@21,@28,@42,@14, nil];
        K=[[NSMutableArray alloc] initWithObjects:@0,@56,@35,@28,@21, nil];
        result=[[NSMutableArray alloc] init];
        [result addObject:[NSMutableDictionary dictionary]];
        self.initialX=3;
        a=6;

    }
    return self;
}

- (void) setInitialX:(float)x
{
    initialX=x;
    [result[0] removeAllObjects];
    [((NSMutableDictionary*)(result[0])) setObject:@0 forKey:@(x)];
}

- (float) initialX
{
    return initialX;
}

-(float) costForZ:(NSInteger)Z OnStage:(NSInteger)i
{
    if (Z<=0) return 0;
    if((Z>0) && (Z<=a)) return Z*35+[K[i] floatValue]; // formula1
    if(Z>a) return 40+25*(Z-6)+[K[i] floatValue];// formula2
}

-(float) maxXforStage:(int)i
{
    float sum=0;
    for( int j=i; j<[D count]; ++j)
    {
        sum+=[D[j] floatValue];
    }
    return sum;
}

-(void) MinCostForIterationNumber:(int) s
{
    [result addObject:[NSMutableDictionary dictionary]];
    for (int i=0; i<=[self maxXforStage:s+1]; ++i) {
        NSEnumerator* enumerator=[result[s-1] keyEnumerator];
        NSNumber* key;
        float res=INFINITY;
        while (key=[enumerator nextObject]) {
            //printf("%f %d ",[key floatValue],i);
            //printf("%f ",[key floatValue]);
            NSInteger z=i+[D[s] floatValue]-[key floatValue];
            if (z>=0){
                float next=[self costForZ:z OnStage:s]+[[result[s-1] objectForKey:key] floatValue];
                if (res>next) res=next;//здесь потом еще как-то сохранять Z
            }
        }
        printf("\n");
        res+=[h[s] floatValue]*i;
        printf("%f ",res);
        [result[s] setObject:@(res) forKey:@(i)];
    }
}

- (float) gogo
{
    for (int i=1; i<5; ++i) {
        [self MinCostForIterationNumber:i];
        printf("\n\n");
    }
    return [[result[4] objectForKey:@0] floatValue];
}

-(void) printResult
{
    /*float costs=0;
    for (int i=0; i<[resultZ count]; ++i)
    {
        printf("Заказать %f деталей на %i этапе. Итоговые затраты: %f \n", [resultZ[i] floatValue], i+1, [stockResult[i] floatValue]);
        costs+=[stockResult[i] floatValue];
        
    }*/

}









@end