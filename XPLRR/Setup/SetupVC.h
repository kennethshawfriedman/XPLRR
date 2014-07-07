//
//  SetupVC.h
//  XPLRR
//
//  Created by Kenny Friedman on 7/2/14.
//  Copyright (c) 2014 Kenneth Friedman. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import <Social/Social.h>
#import <Accounts/Accounts.h>

@interface SetupVC : UIViewController <CLLocationManagerDelegate>

@property (nonatomic, retain) CLLocationManager *locationManager;
@property (nonatomic, retain) ACAccountStore *acStore;

@property (nonatomic, retain) UILabel *welcomeLabel;
@property (nonatomic, retain) UILabel *titleLabel;
@property (nonatomic, retain) UIButton *allowLocation;

@property (nonatomic, retain) UILabel *clickToAllow;

@property (nonatomic, retain) UITextView *infoView;

@end
