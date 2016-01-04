//
//  NWNetWork.h
//  NWNetWorkDemo
//
//  Created by nate on 16/1/4.
//  Copyright © 2016年 nate. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NWNetWork : NSObject

- (NSURLSessionDataTask *)GET:(NSString *)URLString success:(void(^)(NSURLSessionDataTask *task, id  responseObject))success
                      failure:(void (^)(NSURLSessionDataTask * task, NSError *error))failure;

- (NSURLSessionDataTask *)POST:(NSString *)URLString parameters:(NSDictionary *)parameters
 success:(void(^)(NSURLSessionDataTask *task, id  responseObject))success
                       failure:(void (^)(NSURLSessionDataTask * task, NSError *error))failure;


@end
