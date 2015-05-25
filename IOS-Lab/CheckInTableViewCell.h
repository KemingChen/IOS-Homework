//
//  CheckInTableViewCell.h
//  IOS-Lab
//
//  Created by Keming on 2015/5/11.
//  Copyright (c) 2015年 Keming. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CheckInTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *userImageView;
@property (weak, nonatomic) IBOutlet UILabel *userNameView;
@property (weak, nonatomic) IBOutlet UILabel *checkInDesView;
@property (weak, nonatomic) IBOutlet UIImageView *checkInImageView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *checkInConstrainHeight;

@end
