//
//  PersonTableCellTableViewCell.h
//  AutoLayoutTest
//
//  Created by apple on 16/5/7.
//  Copyright © 2016年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Person;
@interface PersonTableCellTableViewCell : UITableViewCell

@property(nonatomic,strong) UILabel *name;
@property(nonatomic,strong) UILabel *summary;
@property(nonatomic,strong) UIImageView *headimg;
@property(nonatomic,strong) UIImageView *img;
@property(nonatomic,strong) UILabel *like;
@property(nonatomic,strong) UILabel *hot;
@property(nonatomic,strong) UILabel *date;
@property(nonatomic,strong) UIView *bottomView;
@property(nonatomic,assign) BOOL didSetupConstraints;

-(void)setData:(Person *)person;
@end
