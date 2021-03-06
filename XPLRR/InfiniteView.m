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
		
		_offFromCenter = 0.0;
		
		[self setContentSize: CGSizeMake(self.bounds.size.width, 5000)];
		
		_containerView = [[UIView alloc] init];
		CGRect cFrame = CGRectMake(0, 0, self.contentSize.width, self.contentSize.height);
		[_containerView setFrame: cFrame];
		[self addSubview: _containerView];
		
		CGPoint offPoint = CGPointMake(0, 2000);
		[self setContentOffset:offPoint];
		
		
		//Uncomment these two lines when not in testing mode
		/*
		[self setShowsHorizontalScrollIndicator:NO];
		[self setShowsVerticalScrollIndicator:NO];
		 */
		//self.backgroundColor = [UIColor blueColor];
		//[self setContentSize: CGSizeMake(2048, 1536)];
    }
    return self;
}

- (void) layoutSubviews {
	[self reCenter];
}

- (void) reCenter {
	CGPoint currentOffset = [self contentOffset];
	CGFloat contentHeight = [self contentSize].height;
	CGFloat centerOffsetY = (contentHeight - [self bounds].size.height)/2.0;
	CGFloat disFromCenterY = fabsf(currentOffset.y-centerOffsetY);
	
//	NSLog(@"%f",disFromCenterY);
//	NSLog(@"%f\n", (contentHeight/4.0));
	
	
	if (disFromCenterY > (contentHeight / 4.0)) {
		self.contentOffset = CGPointMake(centerOffsetY, currentOffset.x);
		_offFromCenter += (centerOffsetY-currentOffset.y);
		NSLog(@"%f",_offFromCenter);
		
		//From streetScroller
//		for (UILabel *label in self.visibleLabels) {
//            CGPoint center = [self.labelContainerView convertPoint:label.center toView:self];
//            center.x += (centerOffsetX - currentOffset.x);
//            label.center = [self convertPoint:center toView:self.labelContainerView];
//        }
	}
	
}

- (void) addContent {
	
}


@end