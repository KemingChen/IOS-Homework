//
//  CheckInController.m
//  IOS-Lab
//
//  Created by Keming on 2015/6/10.
//  Copyright (c) 2015年 Keming. All rights reserved.
//

#import "CheckInController.h"
#import <iToast.h>
#import "CheckIn.h"
#import "DataProvider.h"

@interface CheckInController ()

@end

@implementation CheckInController
CLLocation* _currentLocation = nil;

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self initPickerController];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (void)viewWillAppear:(BOOL)animated
{
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];

    [[LocationProvider sharedProvider] requestCurrentLocationWithDelegate:self];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillHideNotification object:nil];
}

- (void)initPickerController
{
    self.pickerController = [[UIImagePickerController alloc] init];
    self.pickerController.delegate = self;
    self.pickerController.allowsEditing = YES;
}

#pragma mark - Click Event
- (IBAction)clickCloseButton:(id)sender
{
    [self dismissViewControllerAnimated:YES
                             completion:^{
                             }];
}

- (IBAction)clickTakePhoto:(id)sender
{
    self.pickerController.sourceType = UIImagePickerControllerSourceTypeCamera;
    [self presentViewController:self.pickerController animated:YES completion:NULL];
}

- (IBAction)clickSelectPhoto:(id)sender
{
    self.pickerController.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    [self presentViewController:self.pickerController animated:YES completion:NULL];
}
- (IBAction)clickSubmit:(id)sender
{
    UIImage* checkInImage = self.checkInPreviewImageView.image;

    if (checkInImage == nil) {
        [[[iToast makeText:NSLocalizedString(@"請選擇一張照片", @"")] setGravity:iToastGravityBottom] show];
    }
    else if (![self.checkInDescTextField hasText]) {
        [[[iToast makeText:NSLocalizedString(@"請輸入一段敘述", @"")] setGravity:iToastGravityBottom] show];
    }
    else if (_currentLocation == nil) {
        [[[iToast makeText:NSLocalizedString(@"無法抓到您的位置", @"")] setGravity:iToastGravityBottom] show];
    }
    else {
        NSString* desc = self.checkInDescTextField.text;
        [[DataProvider sharedProvider] postCheckInToDataProvider:checkInImage desc:desc location:[_currentLocation coordinate]];
        [self touchesBegan:nil withEvent:nil];
        [self clickCloseButton:nil];
    }
}

- (void)touchesBegan:(NSSet*)touches withEvent:(UIEvent*)event
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

#pragma mark - TextView Delegate
- (void)textViewDidBeginEditing:(UITextView*)textView
{
    self.checkInDescPlaceHolder.hidden = YES;
}

- (void)textViewDidEndEditing:(UITextView*)textView
{
    if (![textView hasText]) {
        self.checkInDescPlaceHolder.hidden = NO;
    }
    else {
        self.checkInDescPlaceHolder.hidden = YES;
    }
}

#pragma mark - UIImagePickerController Delegate
- (void)imagePickerController:(UIImagePickerController*)picker didFinishPickingMediaWithInfo:(NSDictionary*)info
{

    UIImage* chosenImage = info[UIImagePickerControllerEditedImage];
    self.checkInPreviewImageView.image = chosenImage;
    CGFloat aspectRatioMult = self.checkInPreviewImageView.image.size.width / self.checkInPreviewImageView.image.size.height;
    self.previewImageViewHeightConstraint.constant = self.checkInPreviewImageView.frame.size.width / aspectRatioMult;

    [picker dismissViewControllerAnimated:YES completion:NULL];
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController*)picker
{

    [picker dismissViewControllerAnimated:YES completion:NULL];
}

#pragma mark - LocationProviderDelegate
- (void)locationProvider:(LocationProvider*)provider provideCurrentLocation:(CLLocation*)location
{
    _currentLocation = location;
}
@end
