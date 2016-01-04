//
//  NWNetWork.m
//  NWNetWorkDemo
//
//  Created by nate on 16/1/4.
//  Copyright © 2016年 nate. All rights reserved.
//

#import "NWNetWork.h"

@implementation NWNetWork

- (NSURLSessionDataTask *)GET:(NSString *)URLString success:(void (^)(NSURLSessionDataTask *, id _Nullable))success failure:(void (^)(NSURLSessionDataTask * _Nullable, NSError *))failure {
    
    NSURL *URL = [NSURL URLWithString:URLString];
    NSURLRequest *request = [NSURLRequest requestWithURL:URL];
    
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *task = [session dataTaskWithRequest:request
                                            completionHandler:
                                  ^(NSData *data, NSURLResponse *response, NSError *error) {
                                      
                                      if (!error) {
                                          NSError* error = nil;
                                          id result = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
                                          if (success) {
                                              success(task, result);
                                          }
                                      } else {
                                          
                                          if (failure) {
                                              failure(task, error);
                                          }
                                      }
                                  }];
    
    [task resume];
    return task;
}

- (NSURLSessionDataTask *)POST:(NSString *)URLString parameters:(NSDictionary *)parameters success:(void (^)(NSURLSessionDataTask *, id))success failure:(void (^)(NSURLSessionDataTask *, NSError *))failure {
    
    NSURL *URL = [NSURL URLWithString:URLString];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:URL cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:60.0];
    [request addValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [request addValue:@"application/json" forHTTPHeaderField:@"Accept"];
    [request setHTTPMethod:@"POST"];
    NSData *postData = [NSJSONSerialization dataWithJSONObject:parameters options:0 error:nil];
    [request setHTTPBody:postData];
    
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *task = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        if (!error) {
            NSError* error = nil;
            id result = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
            if (success) {
                success(task, result);
            }
        } else {
            
            if (failure) {
                failure(task, error);
            }
        }
    }];
    
    [task resume];
    return task;
}





@end
