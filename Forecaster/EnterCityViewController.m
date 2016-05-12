//
//  EnterCityViewController.m
//  Forecaster
//
//  Created by Elena Maso Willen on 07/05/2016.
//  Copyright © 2016 Training. All rights reserved.
//

#import "EnterCityViewController.h"
#import <CoreLocation/CoreLocation.h>
#import "City.h"

@interface EnterCityViewController ()

@property (weak, nonatomic) IBOutlet UITextField *cityTextField;

- (IBAction)okButtonPressed:(id)sender;

@end

@implementation EnterCityViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)okButtonPressed:(id)sender {
    
    NSString *citychosen = [[NSString alloc] initWithString:self.cityTextField.text];
    
    NSLog(@"City is : %@", citychosen);
    
    CLGeocoder *geoCoder = [[CLGeocoder alloc] init];

    [geoCoder geocodeAddressString:citychosen completionHandler:^(NSArray<CLPlacemark *> * _Nullable placemarks, NSError * _Nullable error) {
        
        CLPlacemark *placemark = placemarks[0];
        
        CLLocationCoordinate2D coords = CLLocationCoordinate2DMake(placemark.location.coordinate.latitude, placemark.location.coordinate.longitude);
    
    if (coords.latitude == 0 && coords.longitude == 0 ) {
        
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Error" message:@"This is not a City Name. Please type a valid city." preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction *ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        }];
        
        [alert addAction:ok];
        
        [self presentViewController:alert animated:YES completion:nil];
    } else {
        [self.delegate cityHasBeenChosen:citychosen];

    }
    }];
        
    
//    [self.delegate cityHasBeenChosen:citychosen];
}
@end
