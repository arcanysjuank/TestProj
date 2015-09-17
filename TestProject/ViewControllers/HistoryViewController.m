//
//  HistoryViewController.m
//  TestProject
//
//  Created by jvega on 9/16/15.
//  Copyright © 2015 jvega. All rights reserved.
//

#import "HistoryViewController.h"
#import "HistoryTableViewCell.h"
#define TableCell @"HistoryCell"
@interface HistoryViewController () <UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableViewHistory;

@end

@implementation HistoryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableView

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 0;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    HistoryTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:TableCell];
    
    if (!cell) {
        cell = [[HistoryTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:TableCell];
    }
    
    return cell;
}

@end
