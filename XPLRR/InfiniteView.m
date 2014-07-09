//
//  InfiniteView.m
//  XPLRR
//
//  Created by Kenny Friedman on 7/2/14.
//  Copyright (c) 2014 Kenneth Friedman. All rights reserved.
//

#import "InfiniteView.h"

@implementation InfiniteView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor blueColor];
		[self setContentSize: CGSizeMake(2048, 1536)];
		
    }
    return self;
}

- (void) layoutSubviews {
	
	//Called when view is moved. 
	
	//	NSLog(@"%f, %f", self.contentOffset.x, self.contentSize.width);
//	
//	if (self.contentOffset.x > self.contentSize.width-1074) {
//		[self setContentSize:CGSizeMake(self.contentSize.width+1000, self.contentSize.height)];
//		NSLog(@"MODIFIED");
//	} else if (self.contentOffset.x < self.con)
//	
}


- (void) populateCurrentView {
	
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
