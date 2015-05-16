//
//  DrawBoardView.h
//  FingerPaint
//
//  Created by JIAN WANG on 5/15/15.
//  Copyright (c) 2015 JWANG. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol Path <NSObject>

-(NSMutableArray *)getPathArray;

@end

@interface DrawBoardView : UIView

@property (nonatomic, weak) id<Path> delegate;

@end
