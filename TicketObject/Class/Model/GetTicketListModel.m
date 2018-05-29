//
//  GetTicketListModel.m
//  TicketObject
//
//  Created by 沈阳 on 2018/5/24.
//  Copyright © 2018年 沈阳. All rights reserved.
//

#import "GetTicketListModel.h"

@implementation GetTicketListModel
+(void)getTicketListSucceed:(void (^)(id))succee Fail:(void (^)(id))fail{
    [HttpNewWroking postWithUrl:[URL getTicketList] refreshCache:YES params:@{@"key":JHKey} success:^(id successed) {
        NSDictionary * dic = (NSDictionary *)successed;
        NSArray * resA = dic[@"result"];
        NSMutableArray * succeArray = [[NSMutableArray alloc]init];
        if (resA.count > 0) {
            [resA enumerateObjectsUsingBlock:^(NSDictionary * obj, NSUInteger idx, BOOL * _Nonnull stop) {
                GetTicketListModel * model = [GetTicketListModel yy_modelWithDictionary:obj];
                [succeArray addObject:model];
            }];
            succee(succeArray);
        }
        
    } fail:^(id failed) {
        fail(@"获取数据失败");
    }];
}
@end
