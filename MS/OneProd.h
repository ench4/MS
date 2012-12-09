//
//  OneProd.h
//  MS
//
//  Created by Виктор on 29.11.12.
//  Copyright (c) 2012 Виктор. All rights reserved.
//

#import <Foundation/Foundation.h>
/*
 D – интенсивность спроса [ед/день];
 K – стоимость размещения заказа [руб];
 h – стоимость хранения единицы товара в единицу времени [руб/ед/день];
 L – время выполнения заказа [день];
 a – пространство, необходимое для хранения единицы продукции [м3];
 q – уровень объема товара, определяющий разрыв цен [ед];
 c1 – цена до разрыва цен [руб/ед];
 c2 – цена после разрыва цен [руб/ед].
 */

@interface OneProd : NSObject
{
    float yOpt;
    float yMin;
}

@property float D;
@property float K;
@property float h;
@property float L;
@property float a;
@property float q;
@property float c1;
@property float c2;
@property float T;

-(float) optimal;
-(float) calcCapacity;
-(float) capacityWithLambda:(float) lambda;
-(float) recalcYoptWithLambda:(float)lambda;
-(float) calcTCU;
-(float) orderPoint;
-(float) calcPeriod;
@end
