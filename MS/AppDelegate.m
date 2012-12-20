//
//  AppDelegate.m
//  MS
//
//  Created by Виктор on 29.11.12.
//  Copyright (c) 2012 Виктор. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    model1=[[multiProd alloc] init];
    model3=[[NSMutableArray alloc]init];
    model2=[[DynamicModel alloc]init];
    
    model1.warehouseSize=150;
    OneProd* t=[[OneProd alloc] init];
    t.D=50;
    t.K=10;
    t.h=10.5;
    t.L=7;
    t.q=56;
    t.c1=87;
    t.c2=63;
    t.a=2.8;
    [controller1 addObject:t];
    
    t=[[OneProd alloc] init];
    t.D=24;
    t.K=75;
    t.h=17.5;
    t.L=14;
    t.q=12;
    t.c1=24;
    t.c2=17;
    t.a=2.1;
    [controller1 addObject:t];
    
    t=[[OneProd alloc] init];
    t.D=50;
    t.K=45;
    t.h=24.5;
    t.L=21;
    t.q=40;
    t.c1=59;
    t.c2=42;
    t.a=1.4;
    [controller1 addObject:t];
    
    t=[[OneProd alloc] init];
    t.D=30;
    t.K=35;
    t.h=31.5;
    t.L=28;
    t.q=21;
    t.c1=101;
    t.c2=70;
    t.a=0.7;
    [controller1 addObject:t];
    
    randOneProd* t3=[[randOneProd alloc] init];
    t3.D=75;
    t3.K=10;
    t3.h=10.5;
    t3.L=3;
    t3.alpha=0.45;
    t3.sigma=8;
    [controller3 addObject:t3];
    
    t3=[[randOneProd alloc] init];
    t3.D=155;
    t3.K=175;
    t3.h=17.5;
    t3.L=14;
    t3.alpha=0.50;
    t3.sigma=2;
    [controller3 addObject:t3];
    
    t3=[[randOneProd alloc] init];
    t3.D=21;
    t3.K=24;
    t3.h=24.5;
    t3.L=2;
    t3.alpha=0.19;
    t3.sigma=4;
    [controller3 addObject:t3];
    
    t3=[[randOneProd alloc] init];
    t3.D=281;
    t3.K=31;
    t3.h=31.5;
    t3.L=8;
    t3.alpha=0.35;
    t3.sigma=1;
    [controller3 addObject:t3];
    
    
    
    
    Model4*  t4=[[Model4 alloc]init];
    t4.D=900;
    t4.K=10;
    t4.h=110;
    t4.L=3;
    t4.p=8;
    t4.range1=0;
    t4.range2=200;
    [controller4 addObject:t4];
    
    t4=[[Model4 alloc]init];
    t4.D=1400;
    t4.K=175;
    t4.h=19;
    t4.L=14;
    t4.p=44;
    t4.range1=10;
    t4.range2=50;
    [controller4 addObject:t4];
    
    t4=[[Model4 alloc]init];
    t4.D=510;
    t4.K=24;
    t4.h=25;
    t4.L=21;
    t4.p=5;
    t4.range1=30;
    t4.range2=130;
    [controller4 addObject:t4];
    
    t4=[[Model4 alloc]init];
    t4.D=700;
    t4.K=15;
    t4.h=32;
    t4.L=2;
    t4.p=10;
    t4.range1=40;
    t4.range2=120;
    [controller4 addObject:t4];
    
    /*OneDynamicModel* t2=[[OneDynamicModel alloc]init];
    t2.D=0;
    t2.h=0;
    t2.K=0;
    [controller2 addObject:t2];*/
    
    OneDynamicModel* t2=[[OneDynamicModel alloc]init];
    t2.D=4;
    t2.K=56;
    t2.h=21;
    [controller2 addObject:t2];
    
    t2=[[OneDynamicModel alloc]init];
    t2.D=3;
    t2.K=35;
    t2.h=28;
    [controller2 addObject:t2];
    
    t2=[[OneDynamicModel alloc]init];
    t2.D=2;
    t2.K=28;
    t2.h=42;
    [controller2 addObject:t2];
    
    t2=[[OneDynamicModel alloc]init];
    t2.D=1;
    t2.K=21;
    t2.h=14;
    [controller2 addObject:t2];   
    
}
-(IBAction) calcModel1:(id)sender
{
    [res1 setStringValue:[model1 description]];
}
-(IBAction) calcModel3:(id)sender
{
    NSMutableString* s=[NSMutableString string];
    for (int i=0; i<[model3 count]; ++i) {
        [s appendString:[model3[i] description]];
    }
    [res3 setStringValue:s];
}
-(IBAction) calcModel4:(id)sender
{
    NSMutableString* s= [NSMutableString string];
    for (int i=0; i<[model4 count]; ++i) {
        [s appendString:[model4[i] description]];
    }
    [res4 setStringValue:s];
}
-(IBAction) calcModel2:(id)sender
{
    [res2 setStringValue:[model2 description]];
}
@end
