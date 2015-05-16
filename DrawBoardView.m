//
//  DrawBoardView.m
//  FingerPaint
//
//  Created by JIAN WANG on 5/15/15.
//  Copyright (c) 2015 JWANG. All rights reserved.
//

#import "DrawBoardView.h"
#import "ViewController.h"

@implementation DrawBoardView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

-(void)drawRect:(CGRect)rect {
    [super drawRect:rect];
    
//    [[self.delegate getPath] stroke];
    
    NSArray *pathArray = [self.delegate getPaths];
    NSArray *colorArray  = [self.delegate getColors];
    
    for (int i = 0; i < pathArray.count; i++) {
        UIBezierPath *path = [UIBezierPath bezierPath];
        path = pathArray[i];
        [colorArray[i] setStroke];
        [path stroke];
    }
}

@end
