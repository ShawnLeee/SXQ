//
//  DBMovie.m
//  MVVM
//
//  Created by Daniel on 15/8/3.
//  Copyright (c) 2015年 ddd. All rights reserved.
//
#import "DBMovieCast.h"
#import "DBMovie.h"
#import "DBMovieDirector.h"
#import <MJExtension.h>
@implementation DBMovie
+ (NSDictionary *)objectClassInArray
{
    return @{@"casts" : [DBMovieCast class],@"directors" : [DBMovieDirector class]};
}
@end
