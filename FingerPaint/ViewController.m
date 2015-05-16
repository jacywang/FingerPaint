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
@property (strong, nonatomic) IBOutlet UISlider *redSlider;
@property (strong, nonatomic) IBOutlet UISlider *greenSlider;
@property (strong, nonatomic) IBOutlet UISlider *blueSlider;
@property (strong, nonatomic) IBOutlet UILabel *redValueLabel;
@property (strong, nonatomic) IBOutlet UILabel *greenValueLabel;
@property (strong, nonatomic) IBOutlet UILabel *blueValueLabel;
@property (strong, nonatomic) IBOutlet UIButton *colorMix;
@property (strong, nonatomic) NSMutableArray *pathArray;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.drawBoardView.delegate = self;
    
    UIPanGestureRecognizer *panGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(moveFinger:)];
    
    [self.drawBoardView addGestureRecognizer:panGesture];
    
    self.path = [[UIBezierPath alloc] init];
    
    [self.redSlider addTarget:self action:@selector(getRedValue:) forControlEvents:UIControlEventValueChanged];
    [self.greenSlider addTarget:self action:@selector(getGreenValue:) forControlEvents:UIControlEventValueChanged];
    [self.blueSlider addTarget:self action:@selector(getBlueValue:) forControlEvents:UIControlEventValueChanged];
    
    self.pathArray = [NSMutableArray array];
}

-(IBAction)moveFinger:(UIPanGestureRecognizer *)sender {

    if (sender.state == UIGestureRecognizerStateBegan ) {
        startLocation = [sender locationInView:self.view];
        [self.path moveToPoint:startLocation];
    } else if (sender.state == UIGestureRecognizerStateChanged) {
        currentLocation = [sender locationInView:self.view];
        [self.path addLineToPoint:currentLocation];
        
        NSMutableDictionary *pathDictionary = [[NSMutableDictionary alloc] init];
        [pathDictionary setValue:self.path forKey:@"path"];
        [pathDictionary setValue:self.colorMix.backgroundColor forKey:@"color"];
        
        [self.pathArray addObject:pathDictionary];
    }
    
    [self.drawBoardView setNeedsDisplay];
}


-(NSMutableArray *)getPathArray {
    return self.pathArray;
}


-(IBAction)getRedValue:(UISlider *)sender {
    self.redValueLabel.text = [NSString stringWithFormat:@"%0.0f", sender.value];
    self.colorMix.backgroundColor = [UIColor colorWithRed:[self.redValueLabel.text integerValue]/255 green:[self.greenValueLabel.text integerValue]/255 blue:[self.blueValueLabel.text integerValue]/255 alpha:1.0];
}

-(IBAction)getGreenValue:(UISlider *)sender {
    self.greenValueLabel.text = [NSString stringWithFormat:@"%0.0f", sender.value];
    self.colorMix.backgroundColor = [UIColor colorWithRed:[self.redValueLabel.text integerValue]/255 green:[self.greenValueLabel.text integerValue]/255 blue:[self.blueValueLabel.text integerValue]/255 alpha:1.0];
}

-(IBAction)getBlueValue:(UISlider *)sender {
    self.blueValueLabel.text = [NSString stringWithFormat:@"%0.0f", sender.value];
    self.colorMix.backgroundColor = [UIColor colorWithRed:[self.redValueLabel.text integerValue]/255 green:[self.greenValueLabel.text integerValue]/255 blue:[self.blueValueLabel.text integerValue]/255 alpha:1.0];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
