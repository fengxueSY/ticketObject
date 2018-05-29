//
//  HistoryListModel.h
//  TicketObject
//
//  Created by 沈阳 on 2018/5/25.
//  Copyright © 2018年 沈阳. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HistoryListModel : NSObject

@property (nonatomic,copy) NSString * lotteryResList;
@property (nonatomic,copy) NSString * lottery_id;
@property (nonatomic,copy) NSString * lottery_res;
@property (nonatomic,copy) NSString * lottery_no;
@property (nonatomic,copy) NSString * lottery_date;
@property (nonatomic,copy) NSString * lottery_exdate;
@property (nonatomic,copy) NSString * lottery_sale_amount;
@property (nonatomic,copy) NSString * lottery_pool_amount;

+(void)getHistoryListParameter:(NSDictionary *)paramter Succe:(void(^)(id succeed))succe Fail:(void(^)(id failed))fail;
@end
