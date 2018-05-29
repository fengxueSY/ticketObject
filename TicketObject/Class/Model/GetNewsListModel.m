//
//  GetNewsListModel.m
//  TicketObject
//
//  Created by 沈阳 on 2018/5/28.
//  Copyright © 2018年 沈阳. All rights reserved.
//

#import "GetNewsListModel.h"

@implementation GetNewsListModel
+(void)getNewsListParameter:(NSDictionary *)param Succe:(void (^)(id))succe Fail:(void (^)(id))fail{
    [HttpNewWroking postWithUrl:@"http://api.jisuapi.com/news/get" refreshCache:YES params:param success:^(id successed) {
        NSData * data = (NSData *)successed;
        NSDictionary * dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:0];
        NSDictionary * resultDic = dic[@"result"];
        NSArray * listArray = resultDic[@"list"];
        NSMutableArray * succeArray = [[NSMutableArray alloc]init];
        [listArray enumerateObjectsUsingBlock:^(NSDictionary * obj, NSUInteger idx, BOOL * _Nonnull stop) {
            GetNewsListModel * model = [GetNewsListModel yy_modelWithDictionary:obj];
            [succeArray addObject:model];
        }];
        succe(succeArray);
    } fail:^(id failed) {
        fail(failed);
    }];
}
@end
