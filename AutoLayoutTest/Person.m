//
//  Person.m
//  AutoLayoutTest
//
//  Created by apple on 16/5/7.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "Person.h"

@implementation Person

-(id)initWithName:(NSString *)name summary:(NSString *)summary imgUrl:(NSString *)imgUrl like:(NSString *)like hot:(NSString *)hot date:(NSString *)date{
    
    if(self = [super init])
    {
        _name = name;
        _summery = summary;
        _imgUrl = imgUrl;
        _like = like;
        _date = date;
        _hot = hot;
    }
    return self;
    
}
@end
