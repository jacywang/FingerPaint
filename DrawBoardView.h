//
//  DrawBoardView.h
//  FingerPaint
//
//  Created by JIAN WANG on 5/15/15.
//  Copyright (c) 2015 JWANG. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol Path <NSObject>

-(UIBezierPath *)getPath;
-(NSArray *)getPaths;
-(NSArray *)getColors;

@end

@interface DrawBoardView : UIView

@property (nonatomic, weak) id<Path> delegate;

@end
