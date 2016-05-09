//
//  Daily.h
//  Forecaster
//
//  Created by Elena Maso Willen on 09/05/2016.
//  Copyright © 2016 Training. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WeekData.h"


@interface Daily : NSObject

@property (nonatomic, copy) NSString *summary;

@property (nonatomic, strong) WeekData *weekData;


@end
