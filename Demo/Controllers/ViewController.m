//
//  ViewController.m
//  UILabel+Copyable Demo
//
//  Created by Alexandre Santos on 10/04/15.
//  Copyright (c) 2015 iAOS. All rights reserved.
//

#import "ViewController.h"
#import "UILabel+Copyable.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel *textLabel;
@property (weak, nonatomic) IBOutlet UILabel *attributedTextLabel;

@end

@implementation ViewController

#pragma mark - UI Actions

- (IBAction)copyingOptionsChanged:(UISegmentedControl *)segmentedControl
{
    BOOL enabled = segmentedControl.selectedSegmentIndex == 0;
    self.textLabel.copyingEnabled = enabled;
    self.attributedTextLabel.copyingEnabled = enabled;
}

@end
