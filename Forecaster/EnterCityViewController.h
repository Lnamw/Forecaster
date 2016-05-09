//
//  EnterCityViewController.h
//  Forecaster
//
//  Created by Elena Maso Willen on 07/05/2016.
//  Copyright © 2016 Training. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol EnterCityViewControllerDelegate <NSObject>

- (void)cityHasBeenChosen:(NSString *)city;

@end

@interface EnterCityViewController : UIViewController

@property (weak, nonatomic) id<EnterCityViewControllerDelegate>delegate;

@end
