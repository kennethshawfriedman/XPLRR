//
//  SetupVC.m
//  XPLRR
//
//  Created by Kenny Friedman on 7/2/14.
//  Copyright (c) 2014 Kenneth Friedman. All rights reserved.
//

#import "SetupVC.h"

@interface SetupVC ()

@end

@implementation SetupVC

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
		
		[self.view setBackgroundColor:[UIColor whiteColor]];
		
		_welcomeLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 20, 540, 88)];
		_welcomeLabel.textAlignment = NSTextAlignmentCenter;
		_welcomeLabel.text = @"Welcome to";
		_welcomeLabel.font = [UIFont fontWithName:@"Futura-Medium" size:28.0];
		[self.view addSubview:_welcomeLabel];
		
		_titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 88, 540, 88)];
		_titleLabel.textAlignment = NSTextAlignmentCenter;
		_titleLabel.text = @"XPLRR";
		_titleLabel.font = [UIFont fontWithName:@"Futura-Medium" size:88.0];
		[self.view addSubview:_titleLabel];
		
		_clickToAllow = [[UILabel alloc] initWithFrame:CGRectMake(0, 166, 540, 88)];
		_clickToAllow.textAlignment = NSTextAlignmentCenter;
		_clickToAllow.text = @"Tap to allow location and to log into Twitter";
		_clickToAllow.font = [UIFont fontWithName:@"Futura-Medium" size:20.0];
		[self.view addSubview:_clickToAllow];
		
		_allowLocation = [UIButton buttonWithType:UIButtonTypeRoundedRect];
		[_allowLocation addTarget:self action:@selector(allowServices)
		 forControlEvents:UIControlEventTouchUpInside];
		[_allowLocation setTitle:@"Allow location & Twitter" forState:UIControlStateNormal];
		_allowLocation.titleLabel.font = [UIFont fontWithName:@"Futura-Medium" size:25.0];
		_allowLocation.frame = CGRectMake(120.0, 350.0, 300.0, 50.0);
		[self.view addSubview:_allowLocation];
		
    }
    return self;
}

- (void) allowServices {
	CLLocationManager *locationManager = [[CLLocationManager alloc] init];
	locationManager.delegate = self;
	locationManager.distanceFilter = kCLDistanceFilterNone;
	locationManager.desiredAccuracy = kCLLocationAccuracyBest;
	[locationManager startUpdatingLocation];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
