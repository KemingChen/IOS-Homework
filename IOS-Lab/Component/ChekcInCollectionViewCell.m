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

    [user displayPhoto:self.userImageView];
    [checkIn displayPhoto:self.checkInImageView];
}

@end
