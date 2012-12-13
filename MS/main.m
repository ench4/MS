//
//  main.m
//  MS
//
//  Created by Виктор on 29.11.12.
//  Copyright (c) 2012 Виктор. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "Model4.h"
#import "NormalDistr.h"
#import "DinamicModel.h"

int main(int argc, char *argv[])
{
    DinamicModel* d=[[DinamicModel alloc] init];
    d.initialX=3;
    printf("%f",[d gogo]);
    //return NSApplicationMain(argc, (const char **)argv);
}
