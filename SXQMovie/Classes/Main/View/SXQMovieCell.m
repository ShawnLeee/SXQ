//
//  SXQMovieCell.m
//  SXQMovie
//
//  Created by SXQ on 15/8/11.
//  Copyright (c) 2015年 SXQ. All rights reserved.
//

#import "SXQMovieCell.h"
#import <UIImageView+WebCache.h>
#import "DBMovieImage.h"
#import "DBMovie.h"
#import "SXQRatingView.h"
@interface SXQMovieCell ()
@property (weak, nonatomic) IBOutlet UILabel *movieTitle;
@property (weak, nonatomic) IBOutlet SXQRatingView *ratingView;
@property (weak, nonatomic) IBOutlet UIImageView *movieIconView;
@end
@implementation SXQMovieCell
- (void)setMovie:(DBMovie *)movie
{
    _movie = movie;
    [self.movieIconView sd_setImageWithURL:[NSURL URLWithString:movie.images.small]];
    self.movieTitle.text = movie.title;
    self.ratingView.movie = movie;
}
@end
