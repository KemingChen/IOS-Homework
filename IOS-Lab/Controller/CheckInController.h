//
//  CheckInController.h
//  IOS-Lab
//
//  Created by Keming on 2015/6/10.
//  Copyright (c) 2015年 Keming. All rights reserved.
//

#import "ViewController.h"

@interface CheckInController : ViewController <UITextViewDelegate, UINavigationControllerDelegate, UIImagePickerControllerDelegate>

@property (strong, nonatomic) IBOutlet UIImagePickerController *pickerController;
@property (weak, nonatomic) IBOutlet UIImageView *checkInPreviewImageView;
@property (weak, nonatomic) IBOutlet UILabel *checkInDescPlaceHolder;
@property (weak, nonatomic) IBOutlet UITextView *checkInDescTextField;

@end
