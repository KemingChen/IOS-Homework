//
//  ChekcInCollectionViewCell.h
//  IOS-Lab
//
//  Created by Keming on 2015/5/12.
//  Copyright (c) 2015年 Keming. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DataProvider.h"
#import "CheckIn.h"

@interface ChekcInCollectionViewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView* userImageView;
@property (weak, nonatomic) IBOutlet UIImageView* checkInImageView;

- (void)setCheckIn:(CheckIn*)checkIn;

@end
