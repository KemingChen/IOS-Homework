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

    [self.longitude setText:[NSString stringWithFormat:@"%.7f", checkIn.longitudeValue]];
    [self.latitude setText:[NSString stringWithFormat:@"%.7f", checkIn.latitudeValue]];
    
    [self.motionX setText:[NSString stringWithFormat:@"P -> %.5f", checkIn.motionPitchValue]];
    [self.motionY setText:[NSString stringWithFormat:@"R -> %.5f", checkIn.motionRollValue]];
    [self.motionZ setText:[NSString stringWithFormat:@"Y -> %.5f", checkIn.motionYawValue]];

    [checkIn displayPhoto:self.checkInImageView];
    CGFloat aspectRatioMult = self.checkInImageView.image.size.width / self.checkInImageView.image.size.height;
    self.checkInConstrainHeight.constant = self.checkInImageView.frame.size.width / aspectRatioMult;
}

@end
