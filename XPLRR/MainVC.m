//
//  MainVC.m
//  XPLRR
//
//  Created by Kenny Friedman on 7/2/14.
//  Copyright (c) 2014 Kenneth Friedman. All rights reserved.
//

#import "MainVC.h"
#import "SetupVC.h"

@interface MainVC ()

@end

@implementation MainVC

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        _iView = [[InfiniteView alloc] initWithFrame:self.view.frame];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
	
	if (![[NSUserDefaults standardUserDefaults] objectForKey:@"notFirstTime"]) {
		[self firstTimeSetup];
		[[NSUserDefaults standardUserDefaults] setObject:@YES forKey:@"notFirstTime"];
	}
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) firstTimeSetup {
	SetupVC *setupVC = [[SetupVC alloc] init];
	UIPopoverController *popC = [[UIPopoverController alloc] initWithContentViewController:setupVC];
}

@end
