//
//  multiProd.h
//  MS
//
//  Created by Виктор on 07.12.12.
//  Copyright (c) 2012 Виктор. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "OneProd.h"

@interface multiProd : NSObject
{
    NSMutableArray *products;
    float warehouseSize;
}
@property NSMutableArray *products;
@property float warehouseSize;
-(float)capacity;
@end
