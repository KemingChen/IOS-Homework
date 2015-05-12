//
//  ViewController.h
//  IOS-Lab
//
//  Created by Keming on 2015/5/11.
//  Copyright (c) 2015年 Keming. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITableViewDataSource, UITableViewDelegate, UICollectionViewDataSource, UICollectionViewDelegate>
@property (strong, nonatomic) IBOutlet UIView *parentView;
@property (weak, nonatomic) IBOutlet UITableView* tableView;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

- (IBAction)clickTableViewTab:(id)sender;
- (IBAction)clickCollectionViewTab:(id)sender;

@end
