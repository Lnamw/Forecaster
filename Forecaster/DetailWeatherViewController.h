//
//  DetailWeatherViewController.h
//  Forecaster
//
//  Created by Elena Maso Willen on 10/05/2016.
//  Copyright © 2016 Training. All rights reserved.
//

#import <UIKit/UIKit.h>

@class City;

@interface DetailWeatherViewController : UIViewController

@property (strong, nonatomic) City *citySelected;

@property (weak, nonatomic) IBOutlet UILabel *deatilSummaryLabel;
@property (weak, nonatomic) IBOutlet UILabel *iconLabel;
@property (weak, nonatomic) IBOutlet UILabel *temperatureLabel;

- (IBAction)wekForecastButtonPressed:(id)sender;


@end
