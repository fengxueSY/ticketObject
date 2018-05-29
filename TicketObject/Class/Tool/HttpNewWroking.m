//
//  HttpNewWroking.m
//  TicketObject
//
//  Created by 沈阳 on 2018/5/24.
//  Copyright © 2018年 沈阳. All rights reserved.
//

#import "HttpNewWroking.h"

@implementation HttpNewWroking
+(void)getWithUrl:(NSString *)url refreshCache:(BOOL)refreshCache params:(NSDictionary *)params success:(void (^)(id))success fail:(void (^)(id))fail{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager GET:url parameters:params progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
             success(responseObject);
    }failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull   error) {
             fail(error);
    }];
}
+(void)postWithUrl:(NSString *)url refreshCache:(BOOL)refreshCache params:(id)params success:(void (^)(id))success fail:(void (^)(id))fail{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    if ([url isEqualToString:@"http://api.jisuapi.com/news/get"]) {
        manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    }
    
    [manager POST:url parameters:params progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        success(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        fail(error);
    }];
}
@end
