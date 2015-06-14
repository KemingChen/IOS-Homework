//
//  CheckInTableViewCell.h
//  IOS-Lab
//
//  Created by Keming on 2015/5/11.
//  Copyright (c) 2015年 Keming. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DataProvider.h"
#import "CheckIn.h"

@interface CheckInTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView* userImageView;
@property (weak, nonatomic) IBOutlet UILabel* userNameView;
@property (weak, nonatomic) IBOutlet UILabel* checkInDesView;
@property (weak, nonatomic) IBOutlet UIImageView* checkInImageView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint* checkInConstrainHeight;
@property (weak, nonatomic) IBOutlet UILabel *motionX;
@property (weak, nonatomic) IBOutlet UILabel *motionY;
@property (weak, nonatomic) IBOutlet UILabel *motionZ;
@property (weak, nonatomic) IBOutlet UILabel *longitude;
@property (weak, nonatomic) IBOutlet UILabel *latitude;

- (void)setCheckIn:(CheckIn*)checkIn;

@end
