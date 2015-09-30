//
//  TabBarViewController.m
//  TestProject
//
//  Created by jvega on 9/14/15.
//  Copyright © 2015 jvega. All rights reserved.
//

#import "TabBarViewController.h"

#define First @"FirstView"
#define Second @"SecondView"
#define Third @"ThirdView"


@interface TabBarViewController ()

@end

@implementation TabBarViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    //sample here
    UINavigationController *navFirst = [self getNavigationInStoryboardName:First];
    UINavigationController *navSecond = [self getNavigationInStoryboardName:Second];
    UINavigationController *navThird = [self getNavigationInStoryboardName:Third];

    self.viewControllers = @[navFirst, navSecond, navThird];
}


- (UINavigationController *)getNavigationInStoryboardName:(NSString *)name {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:name bundle:nil];
    return [storyboard instantiateInitialViewController];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
