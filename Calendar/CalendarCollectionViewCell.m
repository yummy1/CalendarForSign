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
    self.layer.borderColor = [UIColor colorWithRed:230/255.0 green:230/255.0 blue:230/255.0 alpha:1].CGColor;
    self.layer.borderWidth = 0.5;
}

@end
