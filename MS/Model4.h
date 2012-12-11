//
//  model4.h
//  MS
//
//  Created by Виктор on 11.12.12.
//  Copyright (c) 2012 Виктор. All rights reserved.
//

#import <Foundation/Foundation.h>
/*
 Равномерный закон распределения вероятности
 f(x)￼– равномерный закон распределения;
 p – потери от неудовлетворенного спроса [шт/\руб];
 Di – интенсивность спроса [ед/месяц];
 Ki – стоимость размещения заказа [руб];
 hi – стоимость хранения единицы товара в единицу времени [руб/ед/день];
 Li – время выполнения заказа [день];
 
 */
@interface Model4 : NSObject
{
    float Mx;
    float c;
    float range1;
    float range2;
    
    float y;
    float R;
}

@property float D;
@property float K;
@property float h;
@property float L;
@property float p;
@property float range1;
@property float range2;


-(BOOL) check;
-(float) findY;


@end
