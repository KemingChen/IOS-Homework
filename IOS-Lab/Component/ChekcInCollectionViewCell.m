//
//  ChekcInCollectionViewCell.m
//  IOS-Lab
//
//  Created by Keming on 2015/5/12.
//  Copyright (c) 2015年 Keming. All rights reserved.
//

#import "ChekcInCollectionViewCell.h"
#import <UIImageView+AFNetworking.h>
#import "User.h"

@implementation ChekcInCollectionViewCell

- (void)setCheckIn:(CheckIn*)checkIn
{
    User* user = checkIn.user;

    [self.userImageView setImageWithURL:[NSURL URLWithString:user.imageURL] placeholderImage:[UIImage imageNamed:@"brand"]];
    self.userImageView.layer.cornerRadius = 40.0;
    self.userImageView.clipsToBounds = YES;

    [self.checkInImageView setImageWithURL:[NSURL URLWithString:checkIn.imageURL] placeholderImage:[UIImage imageNamed:@"day1_1"]];
}

@end
