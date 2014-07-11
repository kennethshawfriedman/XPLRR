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
		
		[self createStartingUI];
    }
    return self;
}

- (void) createStartingUI {
	
	[self.view addSubview:[XPElements addSetUpLabelOfSize:28.0 atHeight:20.0 withText:@"Welcome to"]];
	[self.view addSubview:[XPElements addSetUpLabelOfSize:88.0 atHeight:88.0 withText:@"XPLRR"]];
	[self.view addSubview:[XPElements addSetUpLabelOfSize:20.0 atHeight:166.0 withText:@"Tap to allow location and to log into Twitter"]];
	

	_allowLocation = [UIButton buttonWithType:UIButtonTypeRoundedRect];
	[_allowLocation addTarget:self action:@selector(allowServices) forControlEvents:UIControlEventTouchUpInside];
	[_allowLocation setTitle:@"Allow location & Twitter" forState:UIControlStateNormal];
	_allowLocation.titleLabel.font = [UIFont fontWithName:@"Futura-Medium" size:25.0];
	_allowLocation.frame = CGRectMake(120.0, 350.0, 300.0, 50.0);
	[self.view addSubview:_allowLocation];
	
	_infoView = [[UITextView alloc] initWithFrame:CGRectMake(20, 400, 500, 100)];
	_infoView.font = [UIFont fontWithName:@"Futura-Medium" size:20.0];
	_infoView.textAlignment = NSTextAlignmentCenter;
	[self.view addSubview:_infoView];
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
		ACAccountType *twitterAccountType = [_acStore accountTypeWithAccountTypeIdentifier: ACAccountTypeIdentifierTwitter];
		[_acStore requestAccessToAccountsWithType:twitterAccountType options:NULL completion:^(BOOL granted, NSError *error) {
			if (granted) {
				NSArray *twitterAccounts =
				[_acStore accountsWithAccountType:twitterAccountType];
				NSURL *url = [NSURL URLWithString:@"https://api.twitter.com/1.1/statuses/user_timeline.json"];
				NSDictionary *params = @{@"screen_name" : @"name", @"include_rts" : @"0", @"trim_user" : @"1", @"count" : @"1"};
				SLRequest *request = [SLRequest requestForServiceType:SLServiceTypeTwitter requestMethod:SLRequestMethodGET URL:url parameters:params];
				[request setAccount:[twitterAccounts lastObject]];
				[request performRequestWithHandler: ^(NSData *responseData, NSHTTPURLResponse *urlResponse, NSError *error) {}];
			 }}];
		[_infoView setText:@""];
		[self showBeginButton];
	} else {
		[_infoView setText:@"XPLRR needs access to your Twitter information. Please go to Settings on your iPad and log into Twitter"];
	}
}

- (void) showBeginButton {
	UIButton *beginButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
	[_allowLocation setHidden:YES];
	[beginButton addTarget:self action:@selector(dismissVC) forControlEvents:UIControlEventTouchUpInside];
	[beginButton setTitle:@"Begin" forState:UIControlStateNormal];
	beginButton.titleLabel.font = [UIFont fontWithName:@"Futura-Medium" size:25.0];
	beginButton.frame = CGRectMake(120.0, 300.0, 300.0, 50.0);
	beginButton.alpha = 0.0;
	[self.view addSubview:beginButton];
	[UIView animateWithDuration:0.5 animations:^{
		beginButton.alpha = 1.0;
	}];
}

- (void) dismissVC {
	[self dismissViewControllerAnimated:YES completion:nil];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - CLLocationManagerDelegate

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error {
    UIAlertView *errorAlert = [[UIAlertView alloc] initWithTitle:@"Error" message:@"Failed to Get Your Location" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [errorAlert show];
}

- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation {
	[_locationManager stopUpdatingLocation];
}


@end
