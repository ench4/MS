//
//  main.m
//  MS
//
//  Created by Виктор on 29.11.12.
//  Copyright (c) 2012 Виктор. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "NormalDistr.h"

int main(int argc, char *argv[])
{
    NSLog(@"%f",[NormalDistr inverseNormalDistrFor:0.8159]);
    NSLog(@"%f",[NormalDistr inverseNormalDistrFor:0.5]);
    NSLog(@"%f",[NormalDistr inverseNormalDistrFor:0.0]);
    NSLog(@"%f",[NormalDistr inverseNormalDistrFor:1]);
    //return NSApplicationMain(argc, (const char **)argv);
}
