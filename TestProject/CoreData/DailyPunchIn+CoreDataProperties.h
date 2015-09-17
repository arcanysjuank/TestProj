//
//  DailyPunchIn+CoreDataProperties.h
//  TestProject
//
//  Created by jvega on 9/15/15.
//  Copyright © 2015 jvega. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "DailyPunchIn.h"

NS_ASSUME_NONNULL_BEGIN

@interface DailyPunchIn (CoreDataProperties)

@property (nullable, nonatomic, retain) NSDate *timePunchIn;
@property (nullable, nonatomic, retain) NSNumber *totalBreakHours;
@property (nullable, nonatomic, retain) DailyLogin *dailyLogin;
@property (nullable, nonatomic, retain) BreakStart *breakStarts;
@property (nullable, nonatomic, retain) DailyPunchOut *dailyPunchOut;

@end

NS_ASSUME_NONNULL_END
