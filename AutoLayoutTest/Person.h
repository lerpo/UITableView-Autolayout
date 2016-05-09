//
//  Person.h
//  AutoLayoutTest
//
//  Created by apple on 16/5/7.
//  Copyright © 2016年 apple. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject

@property(nonatomic,copy) NSString *name;
@property(nonatomic,copy) NSString *summery;
@property(nonatomic,copy) NSString *imgUrl;
@property(nonatomic,copy) NSString *like;
@property(nonatomic,copy) NSString *date;
@property(nonatomic,copy) NSString *hot;

-(id)initWithName:(NSString *)name summary:(NSString *)summary imgUrl:(NSString *)imgUrl like:(NSString *)like hot:(NSString *)hot date:(NSString *)date;

@end
