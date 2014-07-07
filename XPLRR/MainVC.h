//
//  MainVC.h
//  XPLRR
//
//  Created by Kenny Friedman on 7/2/14.
//  Copyright (c) 2014 Kenneth Friedman. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "InfiniteView.h"

@interface MainVC : UIViewController

@property (nonatomic, retain) InfiniteView *iView;

- (void) firstTimeSetup;
- (void) showInfiniteView;

@end
