//
//  CheckInTableViewCell.m
//  IOS-Lab
//
//  Created by Keming on 2015/5/11.
//  Copyright (c) 2015年 Keming. All rights reserved.
//

#import "CheckInTableViewCell.h"
#import <UIImageView+AFNetworking.h>

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

    [self.userImageView setImageWithURL:[NSURL URLWithString:user.profileName] placeholderImage:[UIImage imageNamed:@"brand"]];
    self.userImageView.layer.cornerRadius = 40.0;
    self.userImageView.clipsToBounds = YES;

    [self.checkInDesView setText:checkIn.checkInDesc];

    [self.checkInImageView setImageWithURL:[NSURL URLWithString:checkIn.checkInImageName] placeholderImage:[UIImage imageNamed:@"day1_1"]];
    CGFloat aspectRatioMult = self.checkInImageView.image.size.width / self.checkInImageView.image.size.height;
    self.checkInConstrainHeight.constant = self.checkInImageView.frame.size.width / aspectRatioMult;
}

@end
