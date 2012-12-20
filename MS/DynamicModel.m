//
//  DinamicModel.m
//  MS
//
//  Created by Samez on 10.12.12.
//  Copyright (c) 2012 Виктор. All rights reserved.
//

#import "DynamicModel.h"
#import "Result.h"
@implementation OneDynamicModel : NSObject
{
    
}
@synthesize D=D;
@synthesize h=h;
@synthesize K=K;

@end


@implementation DynamicModel

@synthesize periods=periods;
- (void) setInitialX:(float)x
{
    initialX=x;
    [result[0] removeAllObjects];
    [((NSMutableDictionary*)(result[0])) setObject:[[Result alloc]initWithX:0 andX2:0] forKey:@(x)];
}
- (float) initialX
{
    return initialX;
}


-(id) init
{
    self=[super init];
    if(self)
    {
        
        /*D=[[NSMutableArray alloc] initWithObjects:@14,@70,@60,@40, nil];
        h=[[NSMutableArray alloc] initWithObjects:@2,@28,@4,@14, nil];
        K=[[NSMutableArray alloc] initWithObjects:@56,@30,@28,@2, nil];*/
        periods=[NSMutableArray array];
        /*T.D=[[NSMutableArray alloc] initWithObjects:@0,@4,@3,@2,@1, nil];
        T.h=[[NSMutableArray alloc] initWithObjects:@0,@21,@28,@42,@14, nil];
        T.K=[[NSMutableArray alloc] initWithObjects:@0,@56,@35,@28,@21, nil];*/
        result=[[NSMutableArray alloc] init];
        [result addObject:[NSMutableDictionary dictionary]];
        self.initialX=3;
        a=6;

    }
    return self;
}


-(float) costForZ:(NSInteger)Z OnStage:(NSInteger)i
{
    float K=((OneDynamicModel*)periods[i]).K;
    if (Z<=0) return 0;
    if((Z>0) && (Z<=a)) return Z*35+K; // formula1
    if(Z>a) return 20+25*(Z-6)+K;// formula2
}

-(float) maxXforStage:(NSInteger)i
{
    float sum=0;
    for(NSInteger j=i; j<[periods count]; ++j)
    {
        sum+=((OneDynamicModel*)periods[j]).D;
    }
    return sum;
}

-(void) MinCostForIterationNumber:(int) s
{
    [result addObject:[NSMutableDictionary dictionary]];
    for (int i=0; i<=[self maxXforStage:s]; ++i) {
        NSEnumerator* enumerator=[result[s-1] keyEnumerator];
        NSNumber* key;
        Result* res=[[Result alloc]initWithX:INFINITY andX2:0];
        while (key=[enumerator nextObject]) {
            //printf("%f %d ",[key floatValue],i);
            //printf("%f ",[key floatValue]);
            NSInteger z=i+((OneDynamicModel*)periods[s-1]).D-[key floatValue];
            
            if (z>=0){
                float next=[self costForZ:z OnStage:s-1]+((Result*)[result[s-1] objectForKey:key]).x1;
                if (res.x1>next) {
                    res.x1=next;//здесь потом еще как-то сохранять Z
                    res.x2=z;
                    //
                }
            }
        }
        printf("\n");
        res.x1+=((OneDynamicModel*)periods[s-1]).h*i;
        printf("%f \n",res.x1);
        printf("   %d ",i);
        [result[s] setObject:res forKey:@(i)];
    }
}

- (float) gogo
{
    for (int i=1; i<5; ++i) {
        [self MinCostForIterationNumber:i];
        printf("\n\n");
    }
    return ((Result*)[result[4] objectForKey:@0]).x1;
}

-(NSString*) description
{
    [self gogo];
    NSInteger currentX=0;
    Result* value=[[Result alloc] initWithX:0 andX2:0];
    NSMutableString* s=[NSMutableString string];
    //[s appendFormat:@"Заказать %f деталей на %li этапе. Итоговые затраты: %f \n",value.x2,4,value.x1];
    
    for (NSInteger i=[result count]-1; i>0; --i) {
        //d=[self maxXforStage:i];
        value=[result [i] objectForKey:@((NSInteger)(currentX-value.x2+((OneDynamicModel*)periods[i-1]).D-1))];
        printf("sada - %f\n",currentX-value.x2+((OneDynamicModel*)periods[i-1]).D-1);
        currentX=currentX-value.x2+((OneDynamicModel*)periods[i-1]).D-1;
        [s insertString:[NSString stringWithFormat:@"Заказать %f деталей на %li этапе. Итоговые затраты: %f \n",value.x2,i,value.x1]  atIndex:0];
    }
    return s;
}

@end