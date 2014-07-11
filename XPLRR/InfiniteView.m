//
//  InfiniteView.m
//  XPLRR
//
//  Created by Kenny Friedman on 7/2/14.
//  Copyright (c) 2014 Kenneth Friedman. All rights reserved.
//

#import "InfiniteView.h"

@implementation InfiniteView

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
		
		[self setContentSize: CGSizeMake(self.frame.size.width, 5000)];
		
		
		_visibleButtons = [[NSMutableArray alloc] init];
		_containerView = [[UIView alloc] init];
		[_containerView setFrame:CGRectMake(0, 0, self.contentSize.width, self.contentSize.height/2)];
		[self addSubview: _containerView];
		//Uncomment these two lines when not in testing mode
		/*
		[self setShowsHorizontalScrollIndicator:NO];
		[self setShowsVerticalScrollIndicator:NO];
		 */
		//self.backgroundColor = [UIColor blueColor];
		[self setContentSize: CGSizeMake(2048, 1536)];
    }
    return self;
}

- (void) layoutSubviews {
	
}


@end