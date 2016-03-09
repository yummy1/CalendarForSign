//
//  CalendarCollectionViewCell.m
//  Calendar
//
//  Created by 锐拓 on 16/3/9.
//  Copyright © 2016年 锐拓. All rights reserved.
//

#import "CalendarCollectionViewCell.h"
@interface CalendarCollectionViewCell()


@end
@implementation CalendarCollectionViewCell

- (void)awakeFromNib {
    self.layer.borderColor = [UIColor lightGrayColor].CGColor;
    self.layer.borderWidth = 0.5;
}

@end
