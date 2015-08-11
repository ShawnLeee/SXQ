//
//  SXQRatingView.m
//  SXQMovie
//
//  Created by SXQ on 15/8/11.
//  Copyright (c) 2015年 SXQ. All rights reserved.
//

#import "DBMovie.h"
#import "DBMovieRating.h"
#import "SXQRatingView.h"
static const NSInteger count = 5;
static const CGFloat starWidth = 26/2;
static const CGFloat starHeight = 24/2;
@interface SXQRatingView ()
@property (nonatomic,strong) NSMutableArray *starsViewArray;
@property (nonatomic,weak) UILabel *starLabel;
@end
@implementation SXQRatingView
- (NSMutableArray *)starsViewArray
{
    if (!_starsViewArray) {
        _starsViewArray = [NSMutableArray array];
    }
    return _starsViewArray;
}
- (id)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super initWithCoder:aDecoder]) {
        for (int i = 0; i < count; i++ ) {
            UIImageView *imageView = [[UIImageView alloc] init];
            [self.starsViewArray addObject:imageView];
            [self addSubview:imageView];
        }
        UILabel *starLabel = [[UILabel alloc] init];
        starLabel.font = [UIFont systemFontOfSize:11];
        starLabel.textColor = [UIColor redColor];
        starLabel.textAlignment = NSTextAlignmentRight;
        starLabel.backgroundColor = [UIColor clearColor];
        [self addSubview:starLabel];
        self.starLabel = starLabel;
    }
    return self;
}
- (void)layoutSubviews
{
    [super layoutSubviews];
    __block CGFloat starX = 0;
    CGFloat starY = 4;
    [self.starsViewArray enumerateObjectsUsingBlock:^(UIImageView *imageView, NSUInteger idx, BOOL *stop) {
        starX = starWidth * idx;
        imageView.frame = CGRectMake(starX, starY, starWidth, starHeight);
    }];
    UIImageView *lastStar = [self.starsViewArray lastObject];
    self.starLabel.frame = CGRectMake(CGRectGetMaxX(lastStar.frame), 0, 35, 20);
}
- (void)setMovie:(DBMovie *)movie
{
    _movie = movie;
    NSLog(@"%d",movie.rating.stars);
    int  allStar = (int)(movie.rating.stars/10);
    NSLog(@"%d",allStar);
    [self.starsViewArray enumerateObjectsUsingBlock:^(UIImageView *imageView, NSUInteger idx, BOOL *stop) {
        if (idx < allStar) {
            imageView.image = [UIImage imageNamed:@"ic_star_red"];
        }
        
    }];
    self.starLabel.text = movie.rating.average;
}
@end
