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
}

- (void) viewDidAppear:(BOOL)animated {
	if (![[NSUserDefaults standardUserDefaults] objectForKey:@"notFirstTime"]) {
		[self firstTimeSetup];
		NSLog(@"SUP");
		[[NSUserDefaults standardUserDefaults] setObject:@YES forKey:@"notFirstTime"];
	}
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) firstTimeSetup {
	SetupVC *setupVC = [[SetupVC alloc] init];
	setupVC.view.backgroundColor = [UIColor blackColor];
	setupVC.modalPresentationStyle = UIModalPresentationFormSheet;
	NSLog(@"NOW");
	[self presentViewController:setupVC animated:YES completion:nil];
	
}

@end
