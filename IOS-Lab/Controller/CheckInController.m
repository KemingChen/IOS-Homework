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

- (void)viewWillAppear:(BOOL)animated
{
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillHideNotification object:nil];
}

#pragma mark - Click Event
- (IBAction)clickCloseButton:(id)sender
{
    [self dismissViewControllerAnimated:YES
                             completion:^{
                             }];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.checkInDescTextField resignFirstResponder];
}

#pragma mark - KeyBoard Event
- (void)keyboardWillShow:(NSNotification*)notification
{
    CGSize keyboardSize = [[[notification userInfo] objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue].size;

    [UIView animateWithDuration:0.3
                     animations:^{
                         CGRect f = self.view.frame;
                         f.origin.y = -keyboardSize.height;
                         self.view.frame = f;
                     }];
}

- (void)keyboardWillHide:(NSNotification*)notification
{
    [UIView animateWithDuration:0.3
                     animations:^{
                         CGRect f = self.view.frame;
                         f.origin.y = 0.0f;
                         self.view.frame = f;
                     }];
}
@end
