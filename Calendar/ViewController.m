//
//  ViewController.m
//  Calendar
//
//  Created by 锐拓 on 16/3/8.
//  Copyright © 2016年 锐拓. All rights reserved.
//

#import "ViewController.h"
#import "CalendarView.h"
@interface ViewController ()

@property (nonatomic, strong)CalendarView *calendarView;//日历
@property (nonatomic, strong)UIButton *dismissBtn;//消失按钮
@property (nonatomic, strong)UIView *maskView;//遮罩
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}
- (IBAction)calendar:(UIButton *)sender {
    _maskView = [[UIView alloc] init];
    _maskView.backgroundColor = [UIColor blackColor];
    _maskView.alpha = 0.3;
    [self.view addSubview:_maskView];
    _calendarView = [[NSBundle mainBundle] loadNibNamed:NSStringFromClass([CalendarView class]) owner:self options:nil][0];
    _calendarView.layer.borderColor = [UIColor lightGrayColor].CGColor;
    _calendarView.layer.borderWidth = 1;
    _calendarView.layer.cornerRadius = 8;
    _calendarView.clipsToBounds = YES;
    [self.view addSubview:_calendarView];
    _dismissBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [_dismissBtn setImage:[UIImage imageNamed:@"wrong"] forState:UIControlStateNormal];
    [_dismissBtn setBackgroundColor:[UIColor groupTableViewBackgroundColor]];
    [_dismissBtn addTarget:self action:@selector(disCalendar) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_dismissBtn];
    
}
- (void)disCalendar
{
    [_calendarView removeFromSuperview];
    [_dismissBtn removeFromSuperview];
    [_maskView removeFromSuperview];
}
-(void)viewWillLayoutSubviews
{
    _calendarView.frame = CGRectMake(self.view.frame.size.width/2-115, 90, 230, 227);
    _dismissBtn.layer.cornerRadius = _dismissBtn.frame.size.width/2;
    _dismissBtn.clipsToBounds = YES;
    _dismissBtn.layer.borderColor = [UIColor lightGrayColor].CGColor;
    _dismissBtn.layer.borderWidth = 1;
    _dismissBtn.frame = CGRectMake(self.view.frame.size.width/2+105, 80, 25, 25);
    _maskView.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
}

@end
