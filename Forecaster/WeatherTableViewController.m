//
//  WeatherTableViewController.m
//  Forecaster
//
//  Created by Elena Maso Willen on 07/05/2016.
//  Copyright © 2016 Training. All rights reserved.
//

#import "WeatherTableViewController.h"
#import <CoreLocation/CoreLocation.h>
#import "ForecastWeekWeatherTableViewController.h"
#import "WeatherTableViewCell.h"
#import "City.h"


@interface WeatherTableViewController ()


@end

@implementation WeatherTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.citiesArray = [[NSMutableArray alloc] initWithCapacity:0];

    

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - EnterCityViewController Delegate

- (void)cityHasBeenChosen:(NSString *)city {
    
    NSLog(@"City is %@", city);
    
    [self.navigationController popViewControllerAnimated:YES];

    
    CLGeocoder *geoCoder = [[CLGeocoder alloc] init];
    
    __weak typeof (self)weakSelf = self;
    
    [geoCoder geocodeAddressString:city completionHandler:^(NSArray<CLPlacemark *> * _Nullable placemarks, NSError * _Nullable error) {
        
        CLPlacemark *placemark = placemarks[0];
        NSLog(@"Lat: %f, long: %f", placemark.location.coordinate.latitude, placemark.location.coordinate.longitude);
        
        City *newCity = [[City alloc] init];
        newCity.name = city;
        
        CLLocationCoordinate2D coords = CLLocationCoordinate2DMake(placemark.location.coordinate.latitude, placemark.location.coordinate.longitude);
        
        newCity.coordinates = coords;

//        if (coords.latitude == 0 && coords.longitude == 0 ) {
//            
//            UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Error" message:@"This is not a City Name. Please type a valid city." preferredStyle:UIAlertControllerStyleAlert];
//            
//            UIAlertAction *ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
//            }];
//            
//            [alert addAction:ok];
//            
//            [self presentViewController:alert animated:YES completion:nil];
//        }
        
        
        [weakSelf.citiesArray addObject:newCity];
        
        [weakSelf getData:newCity];
    }];
}
    


- (void)getData:(City *)city {
    
    
    NSString *urlApi = [NSString stringWithFormat:@"https://api.forecast.io/forecast/890855825f8e4f0eae3cff9d60bb97ef/%f,%f", city.coordinates.latitude, city.coordinates.longitude];

//    NSString *testUrlAPi = @"https://api.forecast.io/forecast/890855825f8e4f0eae3cff9d60bb97ef/46.251261,6.331331";
    
    NSURLSession *session = [NSURLSession sharedSession];
    
    NSURLSessionDataTask *jsonData = [session dataTaskWithURL:[NSURL URLWithString:urlApi] completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        NSError *jsonError;
        NSDictionary *forecastData = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&jsonError];
        
        NSDictionary *currently = forecastData[@"currently"];

            
        Currently *currentWeather = [[Currently alloc] init];
        currentWeather.summary = currently[@"summary"];
        currentWeather.icon = currently[@"icon"];
        currentWeather.temperture = currently[@"temperature"];
        
        city.currentWeather = currentWeather;
        
        NSDictionary *daily = forecastData[@"daily"];
        
        Daily *dailyWeather = [[Daily alloc] init];
        dailyWeather.summary = daily[@"summary"];
        
        NSArray *dailyData = daily[@"data"];
        for (NSDictionary *dict in dailyData) {
            WeekData *dailyWeekData = [[WeekData alloc] init];
            dailyWeekData.day = dict[@"time"];
            dailyWeekData.minTemp = dict[@"temperatureMin"];
            dailyWeekData.maxTemp = dict[@"temperatureMax"];
            
            dailyWeather.weekData = dailyWeekData;
            city.dailyWeatherForecast = dailyWeather;
        }

        

        
        
        
        dispatch_async(dispatch_get_main_queue(),^{
            [self.tableView reloadData];
        });
        
    }];
    
    [jsonData resume];
    
}

#pragma mark - Table View Delegate

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self performSegueWithIdentifier:@"DetailForecastSegue" sender:nil];
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.citiesArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    WeatherTableViewCell *cell = (WeatherTableViewCell *)[tableView dequeueReusableCellWithIdentifier:@"CityCell" forIndexPath:indexPath];
    
    
    City *city = self.citiesArray[indexPath.row];
    
    int temperature = [city.currentWeather.temperture intValue];
    
    cell.cityNameLabel.text = city.name;
    cell.forecastLabel.text = city.currentWeather.summary;
    cell.temperautreLabel.text =  [NSString stringWithFormat:@"%d °F", temperature];
    

    
    return cell;
}


 #pragma mark - Navigation
 
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
     
     if ([segue.identifier isEqualToString:@"chooseCitySegue"]) {
         EnterCityViewController *vc = (EnterCityViewController *)[segue destinationViewController];
         
         vc.delegate = self;
     }
     
     if ([segue.identifier isEqualToString:@"DetailForecastSegue"]) {
         ForecastWeekWeatherTableViewController *vc = (ForecastWeekWeatherTableViewController *)[segue destinationViewController];
         
         NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
         City *city = self.citiesArray[indexPath.row];
         vc.citySelected = city;
     }
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



@end
