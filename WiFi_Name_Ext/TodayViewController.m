//
//  TodayViewController.m
//  WiFi_Name_Ext
//
//  Created by Yaniv Hasbani on 9/25/15.
//  Copyright (c) 2015 Y's party house. All rights reserved.
//

#import "TodayViewController.h"
#import <NotificationCenter/NotificationCenter.h>
#import <SystemConfiguration/CaptiveNetwork.h>

NSString *requiredNetName = @"moranka";

@interface TodayViewController () <NCWidgetProviding>

@end

@implementation TodayViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSString *wifiName = @"Not Found";
    CFArrayRef interfaces = CNCopySupportedInterfaces();
    
    if (interfaces)
    {
        CFDictionaryRef networkDetails = CNCopyCurrentNetworkInfo(CFArrayGetValueAtIndex(interfaces, 0));
        if (networkDetails)
        {
            wifiName = (NSString *)CFDictionaryGetValue(networkDetails, kCNNetworkInfoKeySSID);
            CFRelease(networkDetails);
        }
    }
    
    //if ([wifiName isEqualToString:requiredNetName])
    //{
       // self.WiFiButton.hidden = NO;
    //}
}
@end