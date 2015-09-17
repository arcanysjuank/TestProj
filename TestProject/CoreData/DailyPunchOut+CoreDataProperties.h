//
//  DailyPunchOut+CoreDataProperties.h
//  TestProject
//
//  Created by jvega on 9/15/15.
//  Copyright © 2015 jvega. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "DailyPunchOut.h"

NS_ASSUME_NONNULL_BEGIN

@interface DailyPunchOut (CoreDataProperties)

@property (nullable, nonatomic, retain) NSDate *timePunchOut;
@property (nullable, nonatomic, retain) DailyPunchIn *dailyPunchIn;

@end

NS_ASSUME_NONNULL_END
