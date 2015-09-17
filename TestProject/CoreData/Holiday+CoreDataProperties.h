//
//  Holiday+CoreDataProperties.h
//  TestProject
//
//  Created by jvega on 9/15/15.
//  Copyright © 2015 jvega. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Holiday.h"

NS_ASSUME_NONNULL_BEGIN

@interface Holiday (CoreDataProperties)

@property (nullable, nonatomic, retain) NSNumber *payPercent;
@property (nullable, nonatomic, retain) DailySchedule *dailySchedule;

@end

NS_ASSUME_NONNULL_END
