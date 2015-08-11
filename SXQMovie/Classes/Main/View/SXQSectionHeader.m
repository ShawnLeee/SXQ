//
//  SXQSectionHeader.m
//  SXQMovie
//
//  Created by SXQ on 15/8/11.
//  Copyright (c) 2015年 SXQ. All rights reserved.
//

#import "SXQSectionHeader.h"
@interface SXQSectionHeader ()

@end
@implementation SXQSectionHeader
- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self = [[[NSBundle mainBundle] loadNibNamed:@"SXQSectionHeader" owner:nil options:nil] lastObject];
    }
    return self;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSLog(@"touch begin");
}
@end
