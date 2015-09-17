//
//  DailyLogin+CoreDataProperties.h
//  TestProject
//
//  Created by jvega on 9/15/15.
//  Copyright © 2015 jvega. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "DailyLogin.h"

NS_ASSUME_NONNULL_BEGIN

@interface DailyLogin (CoreDataProperties)

@property (nullable, nonatomic, retain) NSDate *dateLogin;
@property (nullable, nonatomic, retain) NSString *day;
@property (nullable, nonatomic, retain) NSNumber *totalWorkHours;
@property (nullable, nonatomic, retain) DailySchedule *dailySchedule;
@property (nullable, nonatomic, retain) DailyPunchIn *dailyPunchIn;
@property (nullable, nonatomic, retain) Accounts *account;

@end

NS_ASSUME_NONNULL_END
