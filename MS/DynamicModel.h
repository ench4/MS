//
//  DinamicModel.h
//  MS
//
//  Created by Samez on 10.12.12.
//  Copyright (c) 2012 Виктор. All rights reserved.
//

#import <Foundation/Foundation.h>
@interface OneDynamicModel : NSObject
{
    
}

@property float D;
@property float h;
@property float K;

@end

@interface DynamicModel : NSObject
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

@property NSMutableArray *periods;
@property float initialX;

- (void) printResult;
- (float) gogo;


@end

