//
//  CalendarView.m
//  Calendar
//
//  Created by 锐拓 on 16/3/8.
//  Copyright © 2016年 锐拓. All rights reserved.
//

#import "CalendarView.h"
#import "CalendarCollectionViewCell.h"
#import "DateTool.h"
@interface CalendarView ()<UICollectionViewDataSource, UICollectionViewDelegate>
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (nonatomic, strong)NSMutableArray *signArr;
@end
@implementation CalendarView

- (NSMutableArray *)signArr
{
    if (!_signArr) {
        NSArray *array = @[@2,@5,@7];
        _signArr = [NSMutableArray arrayWithArray:array];
    }
    return _signArr;
}

- (void)drawRect:(CGRect)rect {
    _collectionView.dataSource = self;
    _collectionView.delegate = self;
    _collectionView.showsHorizontalScrollIndicator = NO;
    _collectionView.showsVerticalScrollIndicator = NO;
    [_collectionView registerNib:[UINib nibWithNibName:NSStringFromClass([CalendarCollectionViewCell class]) bundle:nil] forCellWithReuseIdentifier:NSStringFromClass([CalendarCollectionViewCell class])];
}
#pragma mark - collectionView delegate dataSource
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 35;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CalendarCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([CalendarCollectionViewCell class]) forIndexPath:indexPath];
    NSInteger daysInLastMonth = [DateTool totaldaysInMonth:[DateTool lastMonth:[NSDate date]]];
    NSInteger daysInThisMonth = [DateTool totaldaysInMonth:[NSDate date]];
    NSInteger firstWeekday = [DateTool firstWeekdayInThisMonth:[NSDate date]];
    if (indexPath.row < firstWeekday) {
        NSMutableArray *lastMonth = [NSMutableArray array];
        for (int i = 0; i < firstWeekday; i++) {
            [lastMonth addObject:[NSString stringWithFormat:@"%ld", (long)daysInLastMonth]];
            lastMonth = (NSMutableArray *)[[lastMonth reverseObjectEnumerator] allObjects];
            daysInLastMonth--;
        }
        cell.dateNum.text = lastMonth[indexPath.row];
        cell.dateNum.textColor = [UIColor lightGrayColor];
    }else{
        NSInteger today = [DateTool day:[NSDate date]];
        if (indexPath.row < firstWeekday + daysInThisMonth) {
            for (NSNumber *signDay in self.signArr) {
                NSInteger sign = [signDay integerValue];
                if (indexPath.row == sign + firstWeekday-1) {
                    cell.hook.image = [UIImage imageNamed:@"right-red"];
                }
            }
            if (indexPath.row == today) {
                cell.backgroundColor = [UIColor redColor];
                 cell.hook.image = [UIImage imageNamed:@"right-white"];
                cell.dateNum.textColor = [UIColor whiteColor];
            }
            cell.dateNum.text = [NSString stringWithFormat:@"%ld", (long)indexPath.row - 1];
        }else{
            
            NSMutableArray *nextMonth = [NSMutableArray array];
            NSInteger nextMonthDay = 35 - (firstWeekday + daysInThisMonth);
            for (int i = 0; i < nextMonthDay; i++) {
                [nextMonth addObject:[NSString stringWithFormat:@"%ld", (long)(i+1)]];
            }
            cell.dateNum.text = nextMonth[indexPath.row-firstWeekday - daysInThisMonth];
            cell.dateNum.textColor = [UIColor lightGrayColor];
        }
    }
    return cell;
}


@end
