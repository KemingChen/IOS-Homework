//
//  ViewController.h
//  IOS-Lab
//
//  Created by Keming on 2015/5/11.
//  Copyright (c) 2015年 Keming. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITableViewDataSource, UITableViewDelegate, UICollectionViewDataSource, UICollectionViewDelegate>
@property (weak, nonatomic) IBOutlet UIView *parentView;
@property (weak, nonatomic) IBOutlet UITableView* tableView;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *leftOffsetConstrain;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *slideMenuButtonWidth;

- (IBAction)clickSlideMenuButton:(id)sender;
- (IBAction)clickTableViewButton:(id)sender;
- (IBAction)clickCollectionViewButton:(id)sender;

@end
