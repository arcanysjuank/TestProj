//
//  NSDate+Custom.h
//  TestProject
//
//  Created by jvega on 9/15/15.
//  Copyright © 2015 jvega. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (Custom)

@property (nonatomic, strong) NSDateFormatter *dateFormatter;

- (NSString *)stringGetDay;
- (NSString *)stringGetDate;
- (NSDate *)dateGetTimeOnly;
- (NSString *)stringGetTime;
- (NSDate *)dateGetDateOnly;

@end
