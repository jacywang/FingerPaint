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
    NSArray *pathArray = [self.delegate getPathArray];
    for (NSMutableDictionary *dic in pathArray) {
        [[dic valueForKey:@"color"] setStroke];
        [[dic valueForKey:@"path"] stroke];
    }
}

@end
