//
//  DBMovieCell.m
//  MVVM
//
//  Created by Daniel on 15/8/3.
//  Copyright (c) 2015年 ddd. All rights reserved.
//

#import "DBMovieCell.h"
#import "SXQMovieCell.h"
#import "ArrayDataSource+CollectionView.h"
static NSString *CollectionViewIdentier = @"collectionViewIdentier";
@interface DBMovieCell ()
@property (weak, nonatomic) UICollectionView *collectionView;
@property (nonatomic,strong) ArrayDataSource *collectionViewDataSource;
@end

@implementation DBMovieCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
        flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        flowLayout.minimumLineSpacing = 10;
        flowLayout.itemSize = CGSizeMake(100, 200);
        
        UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:self.bounds collectionViewLayout:flowLayout];
        collectionView.translatesAutoresizingMaskIntoConstraints = NO;
        collectionView.backgroundColor = [UIColor whiteColor];
        [self.contentView addSubview:collectionView];
        self.collectionView = collectionView;
        
        [self.collectionView registerNib:[UINib nibWithNibName:@"SXQMovieCell" bundle:nil] forCellWithReuseIdentifier:CollectionViewIdentier];
    }
    return self;
}
- (void)layoutSubviews
{
    [super layoutSubviews];
    [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:self.collectionView attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeLeading multiplier:1.0 constant:0]];
    
    [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:self.collectionView attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeTrailing multiplier:1.0 constant:0]];
    
    [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:self.collectionView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeTop multiplier:1.0 constant:0]];
    
    [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:self.collectionView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeBottom multiplier:1.0 constant:0]];
    
}
- (void)setMovies:(NSArray *)movies
{
    _movies = movies;
    self.collectionViewDataSource = [[ArrayDataSource alloc] initWithItems:movies cellIdentifier:CollectionViewIdentier cellConfigureBlock:^(SXQMovieCell *cell, DBMovie *item) {
        cell.movie = item;
    }];
    
    self.collectionView.dataSource = self.collectionViewDataSource;
}
@end
