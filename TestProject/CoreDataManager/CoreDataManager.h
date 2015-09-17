//
//  CoreDataManager.h
//  TestProject
//
//  Created by jvega on 9/15/15.
//  Copyright © 2015 jvega. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MagicalRecord/MagicalRecord.h>
#import "CoreDataHeader.h"

typedef void(^CompleteBlock)(id complete);
typedef void(^FailBlock)(NSError *error);

@interface CoreDataManager : NSObject

#pragma mark - Passcode
/*
 "passcodes" -> String
 "show" -> Boolean
 */

+ (void)createPasscodeWithInfo:(NSDictionary *)info passcodeBlock:(CompleteBlock)passcodeBlock;
+ (void)updatePasscode:(Passcode *)passcode info:(NSDictionary *)info passcodeBlock:(CompleteBlock)passcodeBlock;
+ (void)passcode:(Passcode *)passcode show:(BOOL)show passcodeBlock:(CompleteBlock)passcodeBlock;

#pragma mark - Account
/*
 "company"
 "firstName"
 "lastName"
 "occupation"
 */
+ (void)createAccount:(NSDictionary *)dictionaryItem complete:(CompleteBlock)complete;
+ (void)updateAccount:(Accounts *)account info:(NSDictionary *)dictionaryItem complete:(CompleteBlock)complete;

#pragma mark - Daily Login
/*
 "dateLogin" -> NSDate
 "day" -> NSString
 "totalWorkHours" -> Float NSNumber
 */

+ (void)createDailyLoginInAccount:(Accounts *)account info:(NSDictionary *)info dailyLogin:(CompleteBlock)dailyLogin;
+ (void)updateDailyLogin:(DailyLogin *)dailyLogin info:(NSDictionary *)info dailyLoginBlock:(CompleteBlock)dailyLoginBlock;
+ (NSArray *)dailyLoginsInAccount:(Accounts *)account;

#pragma mark - Daily PunchIn
/*
 "timePunchIn" -> NSDate
 "totalBreakHours" -> Float NSNumber
 */

+ (void)createDailyPunchinInLogin:(DailyLogin *)dailyLogin info:(NSDictionary *)info punchInBlock:(CompleteBlock)dailyPunchInBlock;
+ (void)updateDailyPunchin:(DailyPunchIn *)punchin info:(NSDictionary *)info punchInBlock:(CompleteBlock)dailyPunchInBlock;

#pragma mark - Daily PunchOut
/*
 "timePunchOut" -> NSDate
 */

+ (void)createDailyPunchinOutPunchIn:(DailyPunchIn *)dailyPunchin info:(NSDictionary *)info punchOutBlock:(CompleteBlock)dailyPunchOutBlock;
+ (void)updateDailyPunchOut:(DailyPunchOut *)punchout info:(NSDictionary *)info punchOutBlock:(CompleteBlock)dailyPunchOutBlock;


@end
