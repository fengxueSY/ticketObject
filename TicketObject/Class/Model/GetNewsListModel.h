//
//  GetNewsListModel.h
//  TicketObject
//
//  Created by 沈阳 on 2018/5/28.
//  Copyright © 2018年 沈阳. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GetNewsListModel : NSObject
@property (nonatomic,copy) NSString * title;
@property (nonatomic,copy) NSString * time;
@property (nonatomic,copy) NSString * posterScreenName;
@property (nonatomic,copy) NSString * src;
@property (nonatomic,copy) NSString * pic;
@property (nonatomic,copy) NSString * content;
@property (nonatomic,copy) NSString * url;


+(void)getNewsListParameter:(NSDictionary *)param Succe:(void(^)(id succeed))succe Fail:(void(^)(id failed))fail;

@end
