//
//  HistoryTableViewCell.m
//  TestProject
//
//  Created by jvega on 9/16/15.
//  Copyright © 2015 jvega. All rights reserved.
//

#import "HistoryTableViewCell.h"

@interface HistoryTableViewCell ()
@property (weak, nonatomic) IBOutlet UILabel *labelDate;
@property (weak, nonatomic) IBOutlet UILabel *labelDay;
@property (weak, nonatomic) IBOutlet UILabel *labelPunchInOut;
@property (weak, nonatomic) IBOutlet UILabel *labelTotalNumberHours;
@property (weak, nonatomic) IBOutlet UIView *viewContainer;

@end

@implementation HistoryTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
