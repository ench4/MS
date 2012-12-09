//
//  Result.h
//  MS
//
//  Created by Виктор on 29.11.12.
//  Copyright (c) 2012 Виктор. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Result : NSObject
{
    float x1,x2;
}
@property float x1;
@property float x2;
@end

Result* sqr(float a,float b,float c);