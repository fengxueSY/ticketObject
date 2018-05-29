//
//  URL.m
//  TicketObject
//
//  Created by 沈阳 on 2018/5/24.
//  Copyright © 2018年 沈阳. All rights reserved.
//

#import "URL.h"

@implementation URL
+(NSString *)getTicketList{
    return @"http://apis.juhe.cn/lottery/types";
}
+(NSString *)getHistoryList{
    return @"http://apis.juhe.cn/lottery/history";
}
+(NSString *)getNewTicketResult{
    return @"http://apis.juhe.cn/lottery/query";
}

+(NSString *)getNewsListUrl{
    return @"http://api.jisuapi.com/news/get?channel=头条&start=0&num=10&appkey=80d9f207c33a8e4b";
}
@end
