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
    
    model1.warehouseSize=700;
    OneProd* t=[[OneProd alloc] init];
    t.D=700;
    t.K=105;
    t.h=10.5;
    t.L=7;
    t.q=560;
    t.c1=875;
    t.c2=630;
    t.a=2.8;
    [controller1 addObject:t];
    
    t=[[OneProd alloc] init];
    t.D=1400;
    t.K=175;
    t.h=17.5;
    t.L=14;
    t.q=1260;
    t.c1=245;
    t.c2=175;
    t.a=2.1;
    [controller1 addObject:t];
    
    t=[[OneProd alloc] init];
    t.D=2100;
    t.K=245;
    t.h=24.5;
    t.L=21;
    t.q=1750;
    t.c1=595;
    t.c2=420;
    t.a=1.4;
    [controller1 addObject:t];
    
    t=[[OneProd alloc] init];
    t.D=2800;
    t.K=315;
    t.h=31.5;
    t.L=28;
    t.q=2100;
    t.c1=1015;
    t.c2=700;
    t.a=0.7;
    [controller1 addObject:t];
    
    randOneProd* t2=[[randOneProd alloc] init];
    t2.D=75;
    t2.K=10;
    t2.h=10.5;
    t2.L=3;
    t2.alpha=0.45;
    t2.sigma=8;
    [controller3 addObject:t2];
    
    t2=[[randOneProd alloc] init];
    t2.D=155;
    t2.K=175;
    t2.h=17.5;
    t2.L=14;
    t2.alpha=0.5;
    t2.sigma=2;
    [controller3 addObject:t2];
    
    t2=[[randOneProd alloc] init];
    t2.D=21;
    t2.K=24;
    t2.h=24.5;
    t2.L=2;
    t2.alpha=0.19;
    t2.sigma=4;
    [controller3 addObject:t2];
    
    t2=[[randOneProd alloc] init];
    t2.D=281;
    t2.K=31;
    t2.h=31.5;
    t2.L=8;
    t2.alpha=0.35;
    t2.sigma=1;
    [controller3 addObject:t2];
    
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

@end
