//
//  SAMPageVC.m
//  Samples
//
//  Created by Gary Morris on 5/13/14.
//  Copyright (c) 2014 Gary Morris. All rights reserved.
//

#import "SAMPageVC.h"

@implementation SAMPageVC

- (void)loadView
{
    UIView* view = [[UIView alloc] init];
    view.autoresizingMask = UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth;
    view.backgroundColor  = [UIColor colorWithWhite:0.5f alpha:1];
    view.userInteractionEnabled = YES;
    self.view = view;

    // add a button on top of the page VC
    UIButton* button = [[UIButton alloc] initWithFrame:CGRectMake(0,380,320,40)];
    button.backgroundColor = [UIColor orangeColor];
    [button setTitle:@"Test Button - Press Here" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateHighlighted];
    [button addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
    [view addSubview:button];
    
    // add a view
    UILabel* label = [[UILabel alloc] initWithFrame:CGRectMake(0,430,320,40)];
    label.backgroundColor = [UIColor redColor];
    label.text = @"Test Label - Tap Here";
    label.font = [UIFont systemFontOfSize:18];
    label.textColor = [UIColor whiteColor];
    label.textAlignment = NSTextAlignmentCenter;
    label.userInteractionEnabled = YES;
    label.tag = 0;
    [view addSubview:label];
    
    // add a tap gesture recognizer to the label
    UITapGestureRecognizer* tapGR = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(labelTapped:)];
    [label addGestureRecognizer:tapGR];
}

- (void)buttonPressed:(UIButton*)button
{
    NSLog(@"%@", button);
}

- (void)labelTapped:(UITapGestureRecognizer*)tapGR
{
    NSLog(@"%@", tapGR.view);
    
    // toggle the text color on the label
    UILabel* label = (UILabel*)tapGR.view;
    if (label.tag) {
        label.textColor = [UIColor whiteColor];
        label.tag       = 0;        // back to initial state
    } else {
        label.textColor = [UIColor blackColor];
        label.tag       = 1;
    }
}

@end
