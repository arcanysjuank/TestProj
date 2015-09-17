//
//  HomeViewController.m
//  TestProject
//
//  Created by jvega on 9/15/15.
//  Copyright © 2015 jvega. All rights reserved.
//

#import "HomeViewController.h"
#import "LoggedInViewController.h"
#import "NSDate+Custom.h"
#import "CoreDataManager.h"

@interface HomeViewController ()
{
    NSString *stringDate;
    NSString *stringDay;
}
@property (weak, nonatomic) IBOutlet UILabel *labelTopText;
@property (weak, nonatomic) IBOutlet UIButton *buttonLogin;

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSDate *dateNow = [NSDate date];
    stringDate = [dateNow stringGetDate];
    stringDay = [dateNow stringGetDay];
    
    Accounts *currentAccount = [Accounts MR_findFirst];
    if (currentAccount) {
        NSString *stringText = [NSString stringWithFormat:@"Good day %@, \nToday is %@",currentAccount.firstName, stringDay];
        NSMutableAttributedString *attString = [[NSMutableAttributedString alloc]initWithString:stringText];
        
        [attString addAttribute:NSFontAttributeName value:[UIFont boldSystemFontOfSize:17] range:NSMakeRange(9, currentAccount.firstName.length)];
        
        [attString addAttribute:NSFontAttributeName value:[UIFont boldSystemFontOfSize:17] range:NSMakeRange(stringText.length - stringDay.length, stringDay.length)];
        
        self.labelTopText.attributedText = attString;
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)onLogin:(UIButton *)sender {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"FirstView" bundle:nil];
    LoggedInViewController *viewController = [storyboard instantiateViewControllerWithIdentifier:LoggedInStoryBoardId];
    viewController.stringDay = stringDay;
    viewController.stringDate = stringDate;
    
    [self.navigationController pushViewController:viewController animated:YES];
//    [self.navigationController presentViewController:viewController animated:YES completion:^{
//        
//    }];
}

@end
