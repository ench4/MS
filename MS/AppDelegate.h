//
//  AppDelegate.h
//  MS
//
//  Created by Виктор on 29.11.12.
//  Copyright (c) 2012 Виктор. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "multiProd.h"

@interface AppDelegate : NSObject <NSApplicationDelegate>
{
    IBOutlet multiProd* model1;
}

@property (assign) IBOutlet NSWindow *window;

@end
