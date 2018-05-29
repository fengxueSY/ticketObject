//
//  TicketHistoryDetaileModel.m
//  TicketObject
//
//  Created by 沈阳 on 2018/5/25.
//  Copyright © 2018年 沈阳. All rights reserved.
//

#import "TicketHistoryDetaileModel.h"
@implementation TicketHistoryDetaileModel_lottery_prize

@end

@implementation TicketHistoryDetaileModel
+ (NSDictionary *)modelContainerPropertyGenericClass{
    
    return @{@"lottery_prize":[TicketHistoryDetaileModel_lottery_prize class]};
}
+(void)getTicketHistoryDetailsParameter:(NSDictionary *)para Succeed:(void (^)(id))succe Fail:(void (^)(id))fail{
    [HttpNewWroking postWithUrl:[URL getNewTicketResult] refreshCache:YES params:para success:^(id successed) {
        NSDictionary * dic = (NSDictionary *)successed;
        NSDictionary * resultDic = dic[@"result"];
        TicketHistoryDetaileModel * model = [TicketHistoryDetaileModel yy_modelWithDictionary:resultDic];
        succe(model);
    } fail:^(id failed) {
        fail(failed);
    }];
}
@end
