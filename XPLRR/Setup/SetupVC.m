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
		
		
		
		
    }
    return self;
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
