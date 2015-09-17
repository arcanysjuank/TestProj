//
//  Accounts+CoreDataProperties.h
//  TestProject
//
//  Created by jvega on 9/15/15.
//  Copyright © 2015 jvega. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Accounts.h"

NS_ASSUME_NONNULL_BEGIN

@interface Accounts (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *company;
@property (nullable, nonatomic, retain) NSString *firstName;
@property (nullable, nonatomic, retain) NSString *lastName;
@property (nullable, nonatomic, retain) NSString *occupation;
@property (nullable, nonatomic, retain) NSSet<DailyLogin *> *dailyLogin;

@end

@interface Accounts (CoreDataGeneratedAccessors)

- (void)addDailyLoginObject:(DailyLogin *)value;
- (void)removeDailyLoginObject:(DailyLogin *)value;
- (void)addDailyLogin:(NSSet<DailyLogin *> *)values;
- (void)removeDailyLogin:(NSSet<DailyLogin *> *)values;

@end

NS_ASSUME_NONNULL_END
