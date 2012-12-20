//
//  AppDelegate.h
//  MS
//
//  Created by Виктор on 29.11.12.
//  Copyright (c) 2012 Виктор. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "multiProd.h"
#import "randOneProd.h"
#import "Model4.h"
#import "DynamicModel.h"

@interface AppDelegate : NSObject <NSApplicationDelegate>
{
    IBOutlet multiProd* model1;
    IBOutlet DynamicModel* model2;
    IBOutlet NSMutableArray* model3;
    IBOutlet NSMutableArray* model4;
    
    IBOutlet NSArrayController* controller1;
    IBOutlet NSArrayController* controller3;
    IBOutlet NSArrayController* controller2;
    IBOutlet NSArrayController* controller4;
    
    IBOutlet NSTextField* res1;
    IBOutlet NSTextField* res2;
    IBOutlet NSTextField* res3;
    IBOutlet NSTextField* res4;
}

@property (assign) IBOutlet NSWindow *window;
-(IBAction) calcModel1:(id)sender;
-(IBAction) calcModel2:(id)sender;
-(IBAction) calcModel3:(id)sender;
-(IBAction) calcModel4:(id)sender;
@end
