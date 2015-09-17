//
//  BreakStart+CoreDataProperties.h
//  TestProject
//
//  Created by jvega on 9/15/15.
//  Copyright © 2015 jvega. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "BreakStart.h"

NS_ASSUME_NONNULL_BEGIN

@interface BreakStart (CoreDataProperties)

@property (nullable, nonatomic, retain) NSDate *timeBreakStart;
@property (nullable, nonatomic, retain) NSSet<DailyPunchIn *> *dailyPunchIn;
@property (nullable, nonatomic, retain) BreakEnd *breakEnd;

@end

@interface BreakStart (CoreDataGeneratedAccessors)

- (void)addDailyPunchInObject:(DailyPunchIn *)value;
- (void)removeDailyPunchInObject:(DailyPunchIn *)value;
- (void)addDailyPunchIn:(NSSet<DailyPunchIn *> *)values;
- (void)removeDailyPunchIn:(NSSet<DailyPunchIn *> *)values;

@end

NS_ASSUME_NONNULL_END
