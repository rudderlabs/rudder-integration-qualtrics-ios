//
//  RUDDERViewController.m
//  Rudder-Qualtrics
//
//  Created by Abhishek on 08/24/2021.
//  Copyright (c) 2019 arnab. All rights reserved.
//

#import "RUDDERViewController.h"
@import Qualtrics;
#import "RUDDERAppDelegate.h"

@interface RUDDERViewController ()

@end

@implementation RUDDERViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)identify1:(id)sender {
    [RUDDERAppDelegate identify:@"Random_1" withKey:@"firstName"];
}

- (IBAction)identify2:(id)sender {
    [RUDDERAppDelegate identify:@"Display" withKey:@"ios"];
}

- (IBAction)intercept_Call:(id)sender {
    [Qualtrics.shared evaluateProjectWithCompletion:^(NSDictionary<NSString *,TargetingResult *>* targetingResults){
       for (NSString* interceptID in targetingResults) {
           TargetingResult *result = targetingResults[interceptID];]
           if ([result passed]) {
               [[Qualtrics shared] displayWithViewController:self autoCloseSurvey:NO];
           }
       }
   }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
