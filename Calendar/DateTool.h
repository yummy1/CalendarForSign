//
//  DateTool.h
//  Calendar
//
//  Created by 锐拓 on 16/3/8.
//  Copyright © 2016年 锐拓. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DateTool : NSObject
//显示天
+ (NSInteger)day:(NSDate *)date;
//显示月
+ (NSInteger)month:(NSDate *)date;
//显示年
+ (NSInteger)year:(NSDate *)date;
//这个月的第一个星期
+ (NSInteger)firstWeekdayInThisMonth:(NSDate *)date;
//本月总天数
+ (NSInteger)totaldaysInMonth:(NSDate *)date;
//上个月
+ (NSDate *)lastMonth:(NSDate *)date;
//下个月
+ (NSDate*)nextMonth:(NSDate *)date;

@end
