//
//  LoggedInViewController.m
//  TestProject
//
//  Created by jvega on 9/15/15.
//  Copyright © 2015 jvega. All rights reserved.
//

#import "LoggedInViewController.h"
#import "CoreDataManager.h"
#import "NSDate+Custom.h"

#define DURATIONTIMER 1
@interface LoggedInViewController () {
    NSDate *dateNow;
    NSTimer *timerHours;
    Accounts *account;
}

@property (weak, nonatomic) IBOutlet UILabel *labelTopText;
@property (weak, nonatomic) IBOutlet UILabel *labelBottomText;
@property (weak, nonatomic) IBOutlet UIButton *buttonLogout;

@end

@implementation LoggedInViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    dateNow = [NSDate date];
    account = [Accounts MR_findFirst];
    self.navigationController.navigationBar.hidden = YES;
    self.navigationItem.hidesBackButton = YES;
    
    [self setTextForLabelTop];
    [self storingDailyLogin];
    

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setTextForLabelTop {
    NSString *stringTimedIn = [dateNow stringGetTime];
    NSString *stringText = [NSString stringWithFormat:@"%@\n%@\n\n%@",self.stringDate, self.stringDay,stringTimedIn];
    NSMutableAttributedString *attrbtdString = [[NSMutableAttributedString alloc]initWithString:stringText];
    
    
    [attrbtdString addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:17] range:NSMakeRange(stringText.length - stringTimedIn.length, stringTimedIn.length)];
    self.labelTopText.attributedText = attrbtdString;
    

}

- (IBAction)onLogOut:(UIButton *)sender {
    
}

#pragma mark - Store to core data

- (void)storingDailyLogin {

    NSDictionary *dictionary = @{@"dateLogin":[dateNow dateGetDateOnly], @"day":self.stringDay,@"totalWorkHours":[NSNumber numberWithFloat:0.0f]};
    
    __weak typeof(self) weakSelf = self;
    
    [CoreDataManager createDailyLoginInAccount:account info:dictionary dailyLogin:^(DailyLogin *dailyLogin) {
        
        [weakSelf storeDailyPunchIn:dailyLogin];
    }];
}

- (void)storeDailyPunchIn:(DailyLogin *)dailyLogin {
    
    NSDictionary *dictionary = @{@"timePunchIn":dateNow};
//    __weak typeof(self) weakSelf = self;
    
    [CoreDataManager createDailyPunchinInLogin:dailyLogin info:dictionary punchInBlock:^(id complete) {
        NSLog(@"done");
    }];
}

#pragma mark - Timer

- (void)playTimer {
    timerHours = [NSTimer scheduledTimerWithTimeInterval:DURATIONTIMER target:self selector:@selector(runTimer) userInfo:nil repeats:YES];
}

- (void)stopTimer {
    if (timerHours) {
        [timerHours invalidate];
    }
    timerHours = nil;
}

- (void)runTimer {
    
}

@end
