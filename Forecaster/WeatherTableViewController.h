//
//  WeatherTableViewController.h
//  Forecaster
//
//  Created by Elena Maso Willen on 07/05/2016.
//  Copyright © 2016 Training. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EnterCityViewController.h"

@interface WeatherTableViewController : UITableViewController <EnterCityViewControllerDelegate>

@property (nonatomic, strong) NSMutableArray *citiesArray;


@end
