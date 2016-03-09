//
//  CalendarView.h
//  Calendar
//
//  Created by 锐拓 on 16/3/8.
//  Copyright © 2016年 锐拓. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CalendarView : UIView
@property (nonatomic, strong) NSDate *date;

@property (nonatomic,strong)  NSMutableArray *signArray;
//今天
@property (nonatomic,strong)  UIButton *dayButton;

@end
