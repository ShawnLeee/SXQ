//
//  TopMovieViewController.m
//  MVVM
//
//  Created by Daniel on 15/8/3.
//  Copyright (c) 2015年 ddd. All rights reserved.
//
#import "SXQSectionHeader.h"
#import "DBMovieImage.h"
#import "DBMovieViewModel.h"
#import "TopMovieViewController.h"
#import "DBMovie.h"
#import "AFNetworking.h"
#import "DBMovieCell.h"
#import "MJExtension.h"
#import "ArrayDataSource+TableView.h"
#import "UIImageView+WebCache.h"
static NSString * const MovieCellIdentifier = @"MovieCell";
@interface TopMovieViewController ()
@property (nonatomic,strong) NSArray *movies;
@property (nonatomic,strong) ArrayDataSource *moviesArrayDataSource;
@property (nonatomic,copy) NSString *headTitle;
@end

@implementation TopMovieViewController
- (NSArray *)movies
{
    if (_movies == nil) {
        _movies = [NSArray array];
    }
    return _movies;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"豆瓣电影TOP250";
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self fetchData];
}
- (void)setupTableView
{
    [self.tableView registerClass:[DBMovieCell class] forCellReuseIdentifier:MovieCellIdentifier];
    self.moviesArrayDataSource = [[ArrayDataSource alloc] initWithItems:self.movies cellIdentifier:MovieCellIdentifier cellConfigureBlock:^(DBMovieCell *cell, DBMovie *item) {
    }];
    self.tableView.dataSource = self.moviesArrayDataSource;
    
}
- (void)fetchData
{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    NSDictionary *params = @{@"start" : @0, @"count" : @10};
    __weak typeof(self) weakSelf = self;
    [manager GET:@"https://api.douban.com/v2/movie/top250" parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
        weakSelf.movies = [DBMovie objectArrayWithKeyValuesArray:responseObject[@"subjects"]];
        self.moviesArrayDataSource.items = weakSelf.movies;
        self.headTitle = responseObject[@"title"];
        [weakSelf.tableView reloadData];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
    }];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    DBMovieCell *cell = [[DBMovieCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:MovieCellIdentifier];
    cell.movies = self.movies;
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 200;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    SXQSectionHeader *header = [[SXQSectionHeader alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 40)];
    header.headTitle.text = self.headTitle;
    return header;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 40;
}
@end
