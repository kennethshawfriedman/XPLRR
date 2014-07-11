//
//  InfiniteView.h
//  XPLRR
//
//  Created by Kenny Friedman on 7/2/14.
//  Copyright (c) 2014 Kenneth Friedman. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

@interface InfiniteView : UIScrollView <UIScrollViewDelegate>

@property (nonatomic, retain) NSMutableArray *visibleButtons;
@property (nonatomic, retain) UIView *containerView;


- (void) reCenter;
- (void) addContent;

@end


