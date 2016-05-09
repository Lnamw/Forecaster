//
//  WeatherTableViewCell.h
//  Forecaster
//
//  Created by Elena Maso Willen on 08/05/2016.
//  Copyright © 2016 Training. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WeatherTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *forecastLabel;
@property (weak, nonatomic) IBOutlet UILabel *temperautreLabel;
@property (weak, nonatomic) IBOutlet UILabel *cityNameLabel;

@end
