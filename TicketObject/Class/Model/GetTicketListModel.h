//
//  GetTicketListModel.h
//  TicketObject
//
//  Created by 沈阳 on 2018/5/24.
//  Copyright © 2018年 沈阳. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GetTicketListModel : NSObject
@property (nonatomic,copy) NSString * lottery_id;
@property (nonatomic,copy) NSString * lottery_name;
@property (nonatomic,copy) NSString * lottery_type_id;
@property (nonatomic,copy) NSString * remarks;

+(void)getTicketListSucceed:(void(^)(id succeed))succee Fail:(void(^)(id failed))fail;

@end
