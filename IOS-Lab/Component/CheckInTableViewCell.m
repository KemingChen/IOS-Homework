//
//  CheckInTableViewCell.m
//  IOS-Lab
//
//  Created by Keming on 2015/5/11.
//  Copyright (c) 2015年 Keming. All rights reserved.
//

#import "CheckInTableViewCell.h"
#import <UIImageView+AFNetworking.h>
#import "User.h"

@implementation CheckInTableViewCell

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setCheckIn:(CheckIn*)checkIn
{
    User* user = checkIn.user;

    [self.userNameView setText:user.name];
    [self.checkInDesView setText:checkIn.desc];

    [user displayPhoto:self.userImageView];

    [checkIn displayPhoto:self.checkInImageView];
    CGFloat aspectRatioMult = self.checkInImageView.image.size.width / self.checkInImageView.image.size.height;
    self.checkInConstrainHeight.constant = self.checkInImageView.frame.size.width / aspectRatioMult;
}

@end
