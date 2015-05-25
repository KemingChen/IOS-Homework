//
//  CheckInTableViewCell.m
//  IOS-Lab
//
//  Created by Keming on 2015/5/11.
//  Copyright (c) 2015年 Keming. All rights reserved.
//

#import "CheckInTableViewCell.h"

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
    User* user = checkIn.poster;

    [self.userNameView setText:user.name];

    [self.userImageView setImage:[UIImage imageNamed:user.profileName]];
    self.userImageView.layer.cornerRadius = 40.0;
    self.userImageView.clipsToBounds = YES;

    [self.checkInDesView setText:checkIn.checkInDesc];

    [self.checkInImageView setImage:[UIImage imageNamed:checkIn.checkInImageName]];
    CGFloat aspectRatioMult = self.checkInImageView.image.size.width / self.checkInImageView.image.size.height;
    self.checkInConstrainHeight.constant = self.checkInImageView.frame.size.width / aspectRatioMult;
}

@end
