//
//  multiProd.h
//  MS
//
//  Created by Виктор on 07.12.12.
//  Copyright (c) 2012 Виктор. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface multiProd : NSObject
{
    NSMutableArray *products;
    float warehouseSize;
}
-(float)capacity;
@end
