//
//  View.m
//  America
//
//  Created by NYU User on 10/27/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "View.h"

@implementation View

- (id) initWithFrame: (CGRect) frame
{
	self = [super initWithFrame: frame];
	if (self) {
		// Initialization code
		self.backgroundColor = [UIColor whiteColor];
	}
	return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void) drawRect: (CGRect) rect
{
	// Drawing code
	CGFloat w = self.bounds.size.width;
	CGFloat h = self.bounds.size.height;
	CGContextRef c = UIGraphicsGetCurrentContext();

	//seven red stripes
	CGContextBeginPath(c);
	CGContextAddRect(c, CGRectMake( 0 * w / 13, 0, w / 13, h));
	CGContextAddRect(c, CGRectMake( 2 * w / 13, 0, w / 13, h));
	CGContextAddRect(c, CGRectMake( 4 * w / 13, 0, w / 13, h));
	CGContextAddRect(c, CGRectMake( 6 * w / 13, 0, w / 13, h));
	CGContextAddRect(c, CGRectMake( 8 * w / 13, 0, w / 13, h));
	CGContextAddRect(c, CGRectMake(10 * w / 13, 0, w / 13, h));
	CGContextAddRect(c, CGRectMake(12 * w / 13, 0, w / 13, h));

	CGContextSetRGBFillColor(c, 1.0, 0.0, 0.0, 1.0);
	CGContextFillPath(c);

	//blue union jack
	CGContextBeginPath(c);
	CGContextAddRect(c, CGRectMake(w * 6 / 13, 0, w * 7 / 13, h * 2 / 5));
	CGContextSetRGBFillColor(c, 0.0, 0.0, 1.0, 1.0);
	CGContextFillPath(c);

	//White star has 5 vertices (points).
	CGPoint center = CGPointMake((6 + 3.5) * w / 13, h / 5); //of union jack
	CGFloat radius = h / 10;	//of circle that the 5 vertices touch
	CGContextBeginPath(c);

	
	for (int i = 0; i <= 10; i = i + 2) {
		CGFloat theta = 2 * M_PI * i / 3;
		CGFloat x = center.x + radius * cosf(theta);
		CGFloat y = center.y - radius * sinf(theta);
		
		if (i == 0) {
			CGContextMoveToPoint(c, x, y);
		} else {
			CGContextAddLineToPoint(c, x, y);
		}
	}
	
	
	for (int i = 1; i <= 10; i = i + 2) {
		CGFloat theta = 2 * M_PI * i / 6;
		CGFloat x = center.x + radius * cosf(theta);
		CGFloat y = center.y - radius * sinf(theta);
		
		if (i == 0) {
			CGContextMoveToPoint(c, x, y);
		} else {
			CGContextAddLineToPoint(c, x, y);
		}
	}
	
	
/*
	CGFloat theta = 0;		//Start with vertex pointing to right.
	CGContextMoveToPoint(c,
		center.x + radius * cosf(theta),
		center.y - radius * sinf(theta)
	);

	theta += 2 * M_PI * 2 / 5;		//vertex pointing to upper left
	CGContextAddLineToPoint(c,
		center.x + radius * cosf(theta),
		center.y - radius * sinf(theta)
	);

	theta += 2 * M_PI * 2 / 5;		//vertex pointing to lower right
	CGContextAddLineToPoint(c,
		center.x + radius * cosf(theta),
		center.y - radius * sinf(theta)
	);

    theta += 2 * M_PI * 2 / 5;		//vertex pointing to upper right
	CGContextAddLineToPoint(c,
		center.x + radius * cosf(theta),
		center.y - radius * sinf(theta)
	);

	theta += 2 * M_PI * 2 / 5;		//vertex pointing to lower left
	CGContextAddLineToPoint(c,
		center.x + radius * cosf(theta),
		center.y - radius * sinf(theta)
	);

	*/
	
	
	//Works even though the star's outline intersects with itself.
	CGContextClosePath(c);
	CGContextSetRGBFillColor(c, 1.0, 1.0, 1.0, 1.0);
	//CGContextSetLineWidth(c, 3.0);
	//CGContextStrokePath (c);
	CGContextFillPath(c);

	//The actor George C. Scott played General George S. Patton (1970).
	UIImage *image = [UIImage imageNamed: @"patton.jpg"];	//100 by 100
	if (image == nil) {
		NSLog(@"could not find the image");
		return;
	}

	//upper left corner of image
	CGPoint point = CGPointMake(
		(w - image.size.width) / 2,
		h - image.size.height - 20
	);

	[image drawAtPoint: point];
}


@end
