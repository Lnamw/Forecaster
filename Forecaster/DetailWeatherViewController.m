//
//  DetailWeatherViewController.m
//  Forecaster
//
//  Created by Elena Maso Willen on 10/05/2016.
//  Copyright © 2016 Training. All rights reserved.
//

#import "DetailWeatherViewController.h"
#import "ForecastWeekWeatherTableViewController.h"
#import "City.h"

@interface DetailWeatherViewController ()

@end

@implementation DetailWeatherViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.deatilSummaryLabel.text = self.citySelected.currentWeather.summary;
    self.iconLabel.text = self.citySelected.currentWeather.icon;
    self.temperatureLabel.text = [NSString stringWithFormat:@"%@ F°", self.citySelected.currentWeather.temperture];



}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([segue.identifier isEqualToString:@"weekForecastSegue"]) {
        ForecastWeekWeatherTableViewController *vc = (ForecastWeekWeatherTableViewController *)[segue destinationViewController];
        
        vc.citySelected = self.citySelected;
    }

}


@end
