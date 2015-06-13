//
//  CheckInAnnotationView.m
//  iOS_Week5
//
//  Created by Charles@Bearsoft on 6/3/15.
//  Copyright (c) 2015 National Taipei Technology University. All rights reserved.
//

#import "CheckInAnnotationView.h"
#import <UIImageView+AFNetworking.h>

@interface CheckInAnnotationView () {

    UIView* _calloutView;
}

@end

@implementation CheckInAnnotationView

- (instancetype)initWithAnnotation:(CheckIn*)checkIn;
{
    self = [super initWithAnnotation:checkIn reuseIdentifier:@"CheckInAnnotation"];

    if (self) {
        _calloutView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 80, 80)];

        [_calloutView setBackgroundColor:[UIColor colorWithRed:0 green:0 blue:0 alpha:0.8]];

        _calloutView.layer.cornerRadius = 5.0f;

        UIImageView* calloutImageView = [[UIImageView alloc] initWithFrame:CGRectMake(5, 5, 70, 70)];

        [calloutImageView setContentMode:UIViewContentModeScaleAspectFit];

        [checkIn displayPhoto:calloutImageView];

        [_calloutView addSubview:calloutImageView];
    }

    return self;
}

- (void)setSelected:(BOOL)selected
{
    [super setSelected:selected];

    if (selected) {
        [self addSubview:_calloutView];

        [_calloutView setCenter:CGPointMake(self.frame.size.width / 4.0f, -45.0f)];
    }
    else {
        [_calloutView removeFromSuperview];
    }
}

@end
