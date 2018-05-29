//
//  TicketHistoryDetaileModel.h
//  TicketObject
//
//  Created by 沈阳 on 2018/5/25.
//  Copyright © 2018年 沈阳. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TicketHistoryDetaileModel_lottery_prize :NSObject
@property (nonatomic,copy) NSString * prize_name;
@property (nonatomic,copy) NSString * prize_num;
@property (nonatomic,copy) NSString * prize_amount;
@property (nonatomic,copy) NSString * prize_require;
@end

@interface TicketHistoryDetaileModel : NSObject
@property (nonatomic,copy) NSString * lottery_id;
@property (nonatomic,copy) NSString * lottery_name;
@property (nonatomic,copy) NSString * lottery_res;
@property (nonatomic,copy) NSString * lottery_no;
@property (nonatomic,copy) NSString * lottery_date;
@property (nonatomic,copy) NSString * lottery_exdate;
@property (nonatomic,copy) NSString * lottery_sale_amount;
@property (nonatomic,copy) NSString * lottery_pool_amount;
@property (nonatomic,copy) NSArray<TicketHistoryDetaileModel_lottery_prize *> * lottery_prize;

+(void)getTicketHistoryDetailsParameter:(NSDictionary *)para Succeed:(void(^)(id succeed))succe Fail:(void(^)(id failed))fail;

@end
