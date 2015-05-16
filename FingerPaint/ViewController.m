//
//  ViewController.m
//  FingerPaint
//
//  Created by JIAN WANG on 5/15/15.
//  Copyright (c) 2015 JWANG. All rights reserved.
//

#import "ViewController.h"
#import "DrawBoardView.h"

@interface ViewController () {
    CGPoint startLocation;
    CGPoint currentLocation;
}

@property (strong, nonatomic) IBOutlet DrawBoardView *drawBoardView;
@property (strong, nonatomic) UIBezierPath *path;
@property (strong, nonatomic) NSArray *paths;
@property (strong, nonatomic) NSArray *colors;
@property (assign, nonatomic) NSInteger colorIndex;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.drawBoardView.delegate = self;
    
    UIPanGestureRecognizer *panGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(moveFinger:)];
    
    [self.drawBoardView addGestureRecognizer:panGesture];
    
    self.path = [UIBezierPath bezierPath];
    
    self.paths = @[[UIBezierPath bezierPath], [UIBezierPath bezierPath], [UIBezierPath bezierPath], [UIBezierPath bezierPath]];
    self.colors = @[[UIColor blackColor],[UIColor redColor], [UIColor greenColor], [UIColor blueColor]];
    self.colorIndex = 0;
}

-(IBAction)moveFinger:(UIPanGestureRecognizer *)sender {
    if (sender.state == UIGestureRecognizerStateBegan ) {
        startLocation = [sender locationInView:self.view];
        [self.paths[self.colorIndex] moveToPoint:startLocation];
    } else if (sender.state == UIGestureRecognizerStateChanged) {
        currentLocation = [sender locationInView:self.view];
        [self.paths[self.colorIndex] addLineToPoint:currentLocation];
    }
    
    [self.drawBoardView setNeedsDisplay];
}

-(NSArray *)getPaths {
    return self.paths;
}

-(NSArray *)getColors {
    return self.colors;
}

-(UIBezierPath *)getPath {
    return self.path;
}

- (IBAction)redButtonPressed:(UIButton *)sender {
    self.colorIndex = 1;
}

- (IBAction)greenButtonPressed:(UIButton *)sender {
    self.colorIndex = 2;
}

- (IBAction)blueButtonPressed:(UIButton *)sender {
    self.colorIndex = 3;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
