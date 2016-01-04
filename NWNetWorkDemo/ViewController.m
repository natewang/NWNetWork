//
//  ViewController.m
//  NWNetWorkDemo
//
//  Created by nate on 16/1/4.
//  Copyright © 2016年 nate. All rights reserved.
//

#import "ViewController.h"
#import "NWNetWork.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)fetchDataButtonPressed:(id)sender {
    
    NWNetWork *netWork = [[NWNetWork alloc]init];
    NSString *url = @"http://api.map.baidu.com/telematics/v3/weather?location=%E5%98%89%E5%85%B4&output=json&ak=5slgyqGDENN7Sy7pw29IUvrZ";
    [netWork GET:url success:^(NSURLSessionDataTask *task, id  _Nullable responseObject) {
        
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError *error) {
        
    }];
}

- (IBAction)sendButtonPressed:(id)sender {
    
    
    
    
}



@end
