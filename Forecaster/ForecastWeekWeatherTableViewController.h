//
//  ForecastWeekWeatherTableViewController.h
//  Forecaster
//
//  Created by Elena Maso Willen on 09/05/2016.
//  Copyright © 2016 Training. All rights reserved.
//

#import <UIKit/UIKit.h>

@class City;

@interface ForecastWeekWeatherTableViewController : UITableViewController

@property (strong, nonatomic) City *citySelected;

@property (nonatomic, strong) NSMutableArray *daysArray;


@end
