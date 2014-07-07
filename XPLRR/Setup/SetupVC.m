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
		
		_infoView = [[UITextView alloc] initWithFrame:CGRectMake(20, 400, 500, 100)];
		_infoView.font = [UIFont fontWithName:@"Futura-Medium" size:20.0];
		_infoView.textAlignment = NSTextAlignmentCenter;
		[self.view addSubview:_infoView];
		
    }
    return self;
}

- (void) allowServices {
	[self setupLocation];
	[self setupTwitter];
}

- (void) setupLocation {
	_locationManager = [[CLLocationManager alloc] init];
	_locationManager.delegate = self;
	_locationManager.distanceFilter = kCLDistanceFilterNone;
	_locationManager.desiredAccuracy = kCLLocationAccuracyBest;
	[_locationManager startUpdatingLocation];
}

- (void) setupTwitter {
	_acStore = [[ACAccountStore alloc] init];
	if ([SLComposeViewController isAvailableForServiceType:SLServiceTypeTwitter]) {
		ACAccountType *twitterAcount = [_acStore accountTypeWithAccountTypeIdentifier:ACAccountTypeIdentifierTwitter];
		
		ACAccountType *twitterAccountType =
		[_acStore accountTypeWithAccountTypeIdentifier:
		 ACAccountTypeIdentifierTwitter];
		
		[_acStore requestAccessToAccountsWithType:twitterAccountType options:NULL completion:^(BOOL granted, NSError *error) {
			if (granted) {
				NSArray *twitterAccounts =
				[_acStore accountsWithAccountType:twitterAccountType];
				NSURL *url = [NSURL URLWithString:@"https://api.twitter.com/1.1/statuses/user_timeline.json"];
				 NSDictionary *params = @{@"screen_name" : @"name",
										  @"include_rts" : @"0",
										  @"trim_user" : @"1",
										  @"count" : @"1"};
				 SLRequest *request = [SLRequest requestForServiceType:SLServiceTypeTwitter requestMethod:SLRequestMethodGET URL:url parameters:params];
				 [request setAccount:[twitterAccounts lastObject]];
				 
				 [request performRequestWithHandler: ^(NSData *responseData, NSHTTPURLResponse *urlResponse, NSError *error) {
					  if (responseData) {
						  if (urlResponse.statusCode >= 200 &&
							  urlResponse.statusCode < 300) {
							  
							   NSError *jsonError;
							   NSDictionary *timelineData =
							   [NSJSONSerialization
							   JSONObjectWithData:responseData
							   options:NSJSONReadingAllowFragments error:&jsonError];
							   if (timelineData) {
								   NSLog(@"Timeline Response: %@\n", timelineData);
							   }
							   else {
								  // Our JSON deserialization went awry
								  NSLog(@"JSON Error: %@", [jsonError localizedDescription]);
							  }
						  }
						  else {
							  // The server did not respond ... were we rate-limited?
							  NSLog(@"The response status code is %d",
									urlResponse.statusCode);
						  }
					  }
				  }];
			 }
			 else {
				 // Access was not granted, or an error occurred
				 NSLog(@"%@", [error localizedDescription]);
			 }
		 }];
		
		_infoView.text = @"";
		[self dismissViewControllerAnimated:YES completion:nil];
	} else {
		_infoView.text = @"XPLRR needs access to your Twitter information. Please go to Settings on your iPad and log into Twitter";
	}
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

#pragma mark - CLLocationManagerDelegate

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error {
    NSLog(@"didFailWithError: %@", error);
    UIAlertView *errorAlert = [[UIAlertView alloc]
							   initWithTitle:@"Error" message:@"Failed to Get Your Location" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [errorAlert show];
}

- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation {
    NSLog(@"didUpdateToLocation: %@", newLocation);
    CLLocation *currentLocation = newLocation;
	[_locationManager stopUpdatingLocation];
}


@end
