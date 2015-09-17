//
//  NSDate+Custom.m
//  TestProject
//
//  Created by jvega on 9/15/15.
//  Copyright © 2015 jvega. All rights reserved.
//

#import "NSDate+Custom.h"
#import <objc/runtime.h>

//static void *SampleAssociatedObject;
const char addAssociateObjectKey;

@implementation NSDate (Custom)

- (NSDateFormatter *)dateFormatter {
    NSDateFormatter *sampleFormatter = nil;
    
    @synchronized(self) {
        if (!(sampleFormatter = [self dateFormatterPrimitive])) {
            sampleFormatter = [self addl_generateAssociatedDictionary];
        }
    }

    return sampleFormatter;
}

- (NSDateFormatter *)dateFormatterPrimitive {

    return objc_getAssociatedObject(self, &addAssociateObjectKey);
}

- (NSDateFormatter *)addl_generateAssociatedDictionary
{
    NSDateFormatter *dateF = [[NSDateFormatter alloc]init];
    [dateF setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"en_US"]];

    [self addl_setAssociatedDateFormatterPrimitive:dateF];
    return dateF;
}

- (void)addl_setAssociatedDateFormatterPrimitive:(NSDateFormatter *)dateFormatter
{
    objc_setAssociatedObject(self, &addAssociateObjectKey, dateFormatter, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (void)setDateFormatter:(NSDateFormatter *)dateFormatter {
    objc_setAssociatedObject(self, &addAssociateObjectKey, dateFormatter, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

#pragma mark - Category Methods

- (NSString *)stringGetDay {
    NSString *string;
    
    [self.dateFormatter setDateFormat:@"EEEE"];
    NSLog(@"self.date : %@",self.dateFormatter);
    string = [self.dateFormatter stringFromDate:self];
    
    
    return string;
}

- (NSString *)stringGetDate {
    
    [self.dateFormatter setDateFormat:@"MMMM dd, yyyy"];
    NSString *stringTime = [self.dateFormatter stringFromDate:self];
    return stringTime;
}

- (NSDate *)dateGetTimeOnly {

    [self.dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSString *stringTime = [self.dateFormatter stringFromDate:self];
    return [self.dateFormatter dateFromString:stringTime];
}

- (NSString *)stringGetTime {

    [self.dateFormatter setDateFormat:@"hh:mm a"];
    NSString *stringTime = [self.dateFormatter stringFromDate:self];
    return stringTime;
}

- (NSDate *)dateGetDateOnly {

    [self.dateFormatter setDateFormat:@"dd MMM yyyy"];
    NSString *stringTime = [self.dateFormatter stringFromDate:self];
    return [self.dateFormatter dateFromString:stringTime];
}

@end
