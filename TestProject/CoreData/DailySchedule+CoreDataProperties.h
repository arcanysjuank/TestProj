//
//  DailySchedule+CoreDataProperties.h
//  TestProject
//
//  Created by jvega on 9/15/15.
//  Copyright © 2015 jvega. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "DailySchedule.h"

NS_ASSUME_NONNULL_BEGIN

@interface DailySchedule (CoreDataProperties)

@property (nullable, nonatomic, retain) NSDate *dateSchedule;
@property (nullable, nonatomic, retain) NSDate *timeIn;
@property (nullable, nonatomic, retain) NSDate *timeOut;
@property (nullable, nonatomic, retain) DailyLogin *dailyLogin;
@property (nullable, nonatomic, retain) Holiday *holiday;

@end

NS_ASSUME_NONNULL_END
