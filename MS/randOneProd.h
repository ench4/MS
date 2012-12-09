//
//  randOneProd.h
//  MS
//
//  Created by Samez on 09.12.12.
//  Copyright (c) 2012 Виктор. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface randOneProd : NSObject
{
    float yOpt;
    float T;
    float orderPoint;
}

@property float D;
@property float K;
@property float h;
@property float L;
@property float sigma;
@property float alpha;
/*
Di  –  интенсивность спроса [ед/день];
Ki  – стоимость размещения заказа [руб];
h i – стоимость хранения единицы товара в единицу времени [руб/ед/день];
α i  –  вероятность истощения запаса;
σ i  –  среднеквадратичное отклонение;
 */

@end
