//
//  CheckInController.m
//  IOS-Lab
//
//  Created by Keming on 2015/6/10.
//  Copyright (c) 2015年 Keming. All rights reserved.
//

#import "CheckInController.h"

@interface CheckInController ()

@end

@implementation CheckInController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Click Event
- (IBAction)clickCloseButton:(id)sender
{
    [self dismissViewControllerAnimated:YES
                             completion:^{
                             }];
}
@end
