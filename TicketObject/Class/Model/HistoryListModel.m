//
//  HistoryListModel.m
//  TicketObject
//
//  Created by 沈阳 on 2018/5/25.
//  Copyright © 2018年 沈阳. All rights reserved.
//

#import "HistoryListModel.h"

@implementation HistoryListModel
+(void)getHistoryListParameter:(NSDictionary *)paramter Succe:(void (^)(id))succe Fail:(void (^)(id))fail{
    [HttpNewWroking postWithUrl:[URL getHistoryList] refreshCache:YES params:paramter success:^(id successed) {
        NSDictionary * dic = (NSDictionary *)successed;
        NSDictionary * resDic = dic[@"result"];
        NSArray * lotteryResListArray = resDic[@"lotteryResList"];
        NSMutableArray * succeArray = [[NSMutableArray alloc]init];
        [lotteryResListArray enumerateObjectsUsingBlock:^(NSDictionary * obj, NSUInteger idx, BOOL * _Nonnull stop) {
            HistoryListModel * model = [HistoryListModel yy_modelWithDictionary:obj];
            [succeArray addObject:model];
        }];
        succe(succeArray);
    } fail:^(id failed) {
        fail(@"获取数据失败");
    }];
}
@end
