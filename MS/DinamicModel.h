//
//  DinamicModel.h
//  MS
//
//  Created by Samez on 10.12.12.
//  Copyright (c) 2012 Виктор. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DinamicModel : NSObject
{
    NSInteger a;//разрыв функции стоимости производства
    NSMutableArray *result;//здесь лежат решения на каждом этапе
    float initialX;//остаток на складе в начале 1 этапа
}

//Di – интенсивность спроса [ед/день];

//Ki – стоимость размещения заказа [руб];

//zi – объем заказываемой продукции [ед];

//hi – стоимость хранения единицы товара в единицу времени [руб/ед/день];

//x –  запас [ед];

@property NSMutableArray *D;
@property NSMutableArray *h;
@property NSMutableArray *K;
@property float initialX;


-(float) calcCforZ:(float)Z andK:(float)k;
-(float) maxX:(int)i;
-(void) calcResult;
-(void) printResult;
-(CGPoint) calcMinForOneIteration:(int)X;


- (float) gogo;






@end

