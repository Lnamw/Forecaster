//
//  City.h
//  Forecaster
//
//  Created by Elena Maso Willen on 08/05/2016.
//  Copyright © 2016 Training. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>
#import "Currently.h"
#import "Daily.h"

@interface City : NSObject

@property (nonatomic, copy) NSString *name;
//@property (nonatomic, assign) NSString *latitude;
//@property (nonatomic, assign) NSString *longitude;
@property (nonatomic, assign) CLLocationCoordinate2D coordinates;



@property (nonatomic, strong) Currently *currentWeather;
@property (nonatomic, strong) Daily *dailyWeatherForecast;


@end
