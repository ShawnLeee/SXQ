//
//  MovieResult.h
//  SXQMovie
//
//  Created by SXQ on 15/8/11.
//  Copyright (c) 2015年 SXQ. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MovieResult : NSObject
@property (nonatomic,assign) int count;
@property (nonatomic,assign) int start;
@property (nonatomic,strong) NSArray *subjects;
@end
