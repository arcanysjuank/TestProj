//
//  CoreDataManager.m
//  TestProject
//
//  Created by jvega on 9/15/15.
//  Copyright © 2015 jvega. All rights reserved.
//

#import "CoreDataManager.h"

@implementation CoreDataManager

#pragma mark - Getting Info Dictionary

+ (id)getInfo:(NSDictionary *)info key:(NSString *)key{
    
    if (info[key]) {
        return info[key];
    }
    return nil;
}

+ (id)getInfo:(id)info {
    
    if (info) {
        return info;
    }
    return nil;
}

#pragma mark - Passcode
/*
 "passcodes" -> String
 "show" -> Boolean
 */
+ (void)storePasscode:(Passcode *)passcode info:(NSDictionary *)info {
    passcode.passcodes = [self getInfo:info[@"passcodes"]];
    passcode.show = [self getInfo:info[@"show"]];
}

+ (void)createPasscodeWithInfo:(NSDictionary *)info passcodeBlock:(CompleteBlock)passcodeBlock {
    __weak typeof(self) weakSelf = self;
    __block Passcode *localPasscode;
    
    [MagicalRecord saveWithBlock:^(NSManagedObjectContext *localContext) {
        localPasscode = [Passcode MR_createEntityInContext:localContext];
        [weakSelf storePasscode:localPasscode info:info];
        
    } completion:^(BOOL contextDidSave, NSError *error) {
        if (contextDidSave) {
            passcodeBlock (localPasscode);
        }
    }];
}

+ (void)updatePasscode:(Passcode *)passcode info:(NSDictionary *)info passcodeBlock:(CompleteBlock)passcodeBlock {
    __weak typeof(self) weakSelf = self;
    __block Passcode *localPasscode;
    
    [MagicalRecord saveWithBlock:^(NSManagedObjectContext *localContext) {
        localPasscode = [passcode MR_inContext:localContext];
        [weakSelf storePasscode:localPasscode info:info];
        
    } completion:^(BOOL contextDidSave, NSError *error) {
        if (contextDidSave) {
            passcodeBlock (localPasscode);
        }
    }];
}

+ (void)passcode:(Passcode *)passcode show:(BOOL)show passcodeBlock:(CompleteBlock)passcodeBlock {
    __weak typeof(self) weakSelf = self;
    __block Passcode *localPasscode;
    
    [MagicalRecord saveWithBlock:^(NSManagedObjectContext *localContext) {
        localPasscode = [passcode MR_inContext:localContext];
        localPasscode.show = [weakSelf getInfo:@(show)];
    } completion:^(BOOL contextDidSave, NSError *error) {
        if (contextDidSave) {
            passcodeBlock (localPasscode);
        }
    }];
}

#pragma mark - Accounts

/*
 "company" -> NSString
 "firstName" -> NSString
 "lastName" -> NSString
 "occupation" -> NSString
 */

+ (void)storeAccount:(Accounts *)account info:(NSDictionary *)info {

    account.company = [self getInfo:info[@"company"]];
    account.firstName = [self getInfo:info[@"firstName"]];
    account.lastName = [self getInfo:info[@"lastName"]];
    account.occupation = [self getInfo:info[@"occupation"]];
}

+ (void)createAccount:(NSDictionary *)dictionaryItem complete:(CompleteBlock)complete {
    
    __weak typeof(self) weakSelf = self;
    __block Accounts *account = nil;
    
    [MagicalRecord saveWithBlock:^(NSManagedObjectContext *localContext) {
        account = [Accounts MR_createEntityInContext:localContext];
        [weakSelf storeAccount:account info:dictionaryItem];
        
    } completion:^(BOOL contextDidSave, NSError *error) {
        if (contextDidSave) {
            complete (account);
        }
    }];
}

+ (void)updateAccount:(Accounts *)account info:(NSDictionary *)dictionaryItem complete:(CompleteBlock)complete {
    
    __weak typeof(self) weakSelf = self;
    __block Accounts *localAccount = nil;
    [MagicalRecord saveWithBlock:^(NSManagedObjectContext *localContext) {
        localAccount = [account MR_inContext:localContext];
        [weakSelf storeAccount:localAccount info:dictionaryItem];
        
    } completion:^(BOOL contextDidSave, NSError *error) {
        if (contextDidSave) {
            complete (localAccount);
        }
    }];
}

#pragma mark - Daily Login
/*
 "dateLogin" -> NSDate
 "day" -> NSString
 "totalWorkHours" -> Float NSNumber
 */

+ (void)storeDailyLogin:(DailyLogin *)dailyLogin info:(NSDictionary *)info {
    dailyLogin.dateLogin = [self getInfo:info[@"dateLogin"]];
    dailyLogin.day = [self getInfo:info[@"day"]];
    dailyLogin.totalWorkHours = [self getInfo:info[@"totalWorkHours"]];
}


+ (void)createDailyLoginInAccount:(Accounts *)account info:(NSDictionary *)info dailyLogin:(CompleteBlock)dailyLogin {
    __weak typeof(self) weakSelf = self;
    __block DailyLogin *login = nil;
    
    [MagicalRecord saveWithBlock:^(NSManagedObjectContext *localContext) {
        Accounts *localAccount = [account MR_inContext:localContext];
        login = [DailyLogin MR_createEntityInContext:localContext];
        
        [weakSelf storeDailyLogin:login info:info];
        
        [localAccount addDailyLoginObject:login];
        login.account = localAccount;
        
        
    } completion:^(BOOL contextDidSave, NSError *error) {
        if (contextDidSave) {
            dailyLogin (login);
        }
    }];
}

+ (void)updateDailyLogin:(DailyLogin *)dailyLogin info:(NSDictionary *)info dailyLoginBlock:(CompleteBlock)dailyLoginBlock {
    __weak typeof(self) weakSelf = self;
    __block DailyLogin *localLogin = nil;
    
    [MagicalRecord saveWithBlock:^(NSManagedObjectContext *localContext) {
        localLogin = [dailyLogin MR_inContext:localContext];
        
        [weakSelf storeDailyLogin:localLogin info:info];
        
    } completion:^(BOOL contextDidSave, NSError *error) {
        if (contextDidSave) {
            dailyLoginBlock (localLogin);
        }
    }];
}

+ (NSArray *)dailyLoginsInAccount:(Accounts *)account {
    
    return [DailyLogin MR_findByAttribute:@"account" withValue:account];
}

#pragma mark - Daily PunchIn
/*
 "timePunchIn" -> NSDate
 "totalBreakHours" -> Float NSNumber
 */

+ (void)storeDailyPunchIn:(DailyPunchIn *)dailyPunchIn info:(NSDictionary *)info {
    dailyPunchIn.timePunchIn = [self getInfo:info[@"timePunchIn"]];
    dailyPunchIn.totalBreakHours = [self getInfo:info[@"totalBreakHours"]];
}

+ (void)createDailyPunchinInLogin:(DailyLogin *)dailyLogin info:(NSDictionary *)info punchInBlock:(CompleteBlock)dailyPunchInBlock {
    __weak typeof(self) weakSelf = self;
    __block DailyPunchIn *punchIn = nil;
    
    [MagicalRecord saveWithBlock:^(NSManagedObjectContext *localContext) {
        DailyLogin *localLogin = [dailyLogin MR_inContext:localContext];
        punchIn = [DailyPunchIn MR_createEntityInContext:localContext];
        
        [weakSelf storeDailyPunchIn:punchIn info:info];
        localLogin.dailyPunchIn = punchIn;
        punchIn.dailyLogin = localLogin;
        
    } completion:^(BOOL contextDidSave, NSError *error) {
        if (contextDidSave) {
            dailyPunchInBlock (punchIn);
        }
    }];
}

+ (void)updateDailyPunchin:(DailyPunchIn *)punchin info:(NSDictionary *)info punchInBlock:(CompleteBlock)dailyPunchInBlock {
    __weak typeof(self) weakSelf = self;
    __block DailyPunchIn *localPunchin;
    
    [MagicalRecord saveWithBlock:^(NSManagedObjectContext *localContext) {
        localPunchin = [punchin MR_inContext:localContext];
        [weakSelf storeDailyPunchIn:localPunchin info:info];
        
    } completion:^(BOOL contextDidSave, NSError *error) {
        if (contextDidSave) {
            dailyPunchInBlock (localPunchin);
        }
    }];
}

#pragma mark - Daily PunchOut
/*
 "timePunchOut" -> NSDate
 */

+ (void)storeDailyPunchOut:(DailyPunchOut *)dailyPunchOut info:(NSDictionary *)info {
    dailyPunchOut.timePunchOut = [self getInfo:info[@"timePunchOut"]];
}

+ (void)createDailyPunchinOutPunchIn:(DailyPunchIn *)dailyPunchin info:(NSDictionary *)info punchOutBlock:(CompleteBlock)dailyPunchOutBlock {
    __weak typeof(self) weakSelf = self;
    __block DailyPunchOut *punchOut = nil;
    
    [MagicalRecord saveWithBlock:^(NSManagedObjectContext *localContext) {
        DailyPunchIn *localPunchIn = [dailyPunchin MR_inContext:localContext];
        punchOut = [DailyPunchOut MR_createEntityInContext:localContext];
        
        [weakSelf storeDailyPunchOut:punchOut info:info];
        localPunchIn.dailyPunchOut = punchOut;
        punchOut.dailyPunchIn = localPunchIn;
        
    } completion:^(BOOL contextDidSave, NSError *error) {
        if (contextDidSave) {
            dailyPunchOutBlock (punchOut);
        }
    }];
}

+ (void)updateDailyPunchOut:(DailyPunchOut *)punchout info:(NSDictionary *)info punchOutBlock:(CompleteBlock)dailyPunchOutBlock {
    __weak typeof(self) weakSelf = self;
    __block DailyPunchOut *localPunchOut;
    
    [MagicalRecord saveWithBlock:^(NSManagedObjectContext *localContext) {
        localPunchOut = [punchout MR_inContext:localContext];
        [weakSelf storeDailyPunchOut:localPunchOut info:info];
        
    } completion:^(BOOL contextDidSave, NSError *error) {
        if (contextDidSave) {
            dailyPunchOutBlock (localPunchOut);
        }
    }];
}


@end
