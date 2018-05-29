//
//  HttpNewWroking.h
//  TicketObject
//
//  Created by 沈阳 on 2018/5/24.
//  Copyright © 2018年 沈阳. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking/AFNetworking.h>

@interface HttpNewWroking : NSObject
// 多一个params参数
+ (void)getWithUrl:(NSString *)url refreshCache:(BOOL)refreshCache params:(NSDictionary *)params success:(void(^)(id successed))success fail:(void(^)(id failed))fail;

+ (void)postWithUrl:(NSString *)url refreshCache:(BOOL)refreshCache params:(id)params success:(void(^)(id successed))success fail:(void(^)(id failed))fail;
@end
