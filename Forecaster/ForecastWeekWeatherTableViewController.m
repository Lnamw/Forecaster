//
//  ForecastWeekWeatherTableViewController.m
//  Forecaster
//
//  Created by Elena Maso Willen on 09/05/2016.
//  Copyright © 2016 Training. All rights reserved.
//

#import "ForecastWeekWeatherTableViewController.h"
#import "City.h"
#import "WeatherTableViewCell.h"
#import "WeekWeatherTableViewCell.h"

@interface ForecastWeekWeatherTableViewController ()


@end

@implementation ForecastWeekWeatherTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    

    self.daysArray = [NSMutableArray arrayWithObject:self.citySelected];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.daysArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
   WeekWeatherTableViewCell *cell = (WeekWeatherTableViewCell *)[tableView dequeueReusableCellWithIdentifier:@"DailyForecastCell" forIndexPath:indexPath];
    
    City *city = self.daysArray[indexPath.row];
    
    int minTemp = [city.dailyWeatherForecast.weekData.minTemp intValue];
    int maxTemp = [city.dailyWeatherForecast.weekData.maxTemp intValue];
    
    cell.dateLabel.text = city.dailyWeatherForecast.weekData.day;
    cell.summaryWeatherLabel.text = city.dailyWeatherForecast.summary;
    cell.minTempLabel.text = [NSString stringWithFormat:@"%d F°", minTemp];
    cell.maxTempLabel.text = [NSString stringWithFormat:@"%d F°", maxTemp];
    
    
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
