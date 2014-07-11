//
//  XPElements.m
//  XPLRR
//
//  Created by Kenny Friedman on 7/11/14.
//  Copyright (c) 2014 Kenneth Friedman. All rights reserved.
//

#import "XPElements.h"

@implementation XPElements

+ (UILabel *) addSetUpLabelOfSize: (float) size atHeight: (float) height withText: (NSString *) text {
	
	CGRect rect = CGRectMake(0, height, 540, 88);
	UILabel *label = [[UILabel alloc] initWithFrame:rect];
	label.textAlignment = NSTextAlignmentCenter;
	label.text = text;
	label.font = [UIFont fontWithName:@"Futura-Medium" size: size];
	return label;
}

@end
