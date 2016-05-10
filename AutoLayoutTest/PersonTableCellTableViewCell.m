//
//  PersonTableCellTableViewCell.m
//  AutoLayoutTest
//
//  Created by apple on 16/5/7.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "PersonTableCellTableViewCell.h"
#import <Masonry.h>
#import "Person.h"
@implementation PersonTableCellTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self){
        self.name = [[UILabel alloc] init];
        self.name.numberOfLines = 1;
        self.name.textAlignment =  NSTextAlignmentLeft;
        self.name.textColor = [UIColor blackColor];
        
        self.summary = [[UILabel alloc] init];
        self.summary.numberOfLines = 0;
        [self.summary setLineBreakMode:NSLineBreakByTruncatingTail];
        self.summary.textAlignment =  NSTextAlignmentCenter;
        self.summary.textColor = [UIColor blackColor];
        
        self.headimg = [[UIImageView alloc] init];
        self.img = [[UIImageView alloc] init];
        
        self.bottomView = [[UIView alloc] init];
        
        self.like = [[UILabel alloc] init];
        self.like.textAlignment = NSTextAlignmentRight;
        
        self.hot = [[UILabel alloc] init];
        self.hot.textAlignment = NSTextAlignmentRight;
       
        self.date = [[UILabel alloc] init];
        self.date.textAlignment = NSTextAlignmentLeft;
        
        self.contentView.backgroundColor = [UIColor lightTextColor];
        [self.contentView addSubview:self.name];
        [self.contentView addSubview:self.summary];
        [self.contentView addSubview:self.headimg];
        [self.contentView addSubview:self.img];
        [self.bottomView addSubview:self.date];
        [self.bottomView addSubview:self.hot];
        [self.bottomView addSubview:self.like];
        [self.contentView addSubview:self.bottomView];
        
    }
    return self;
}
-(void)updateConstraints
{
    if(!self.didSetupConstraints)
    {
    [self.headimg mas_makeConstraints:^(MASConstraintMaker *make) {
      make.left.equalTo(self.contentView.mas_left).with.offset(10);
      make.top.equalTo(self.contentView.mas_top).with.offset(10);
      make.width.mas_lessThanOrEqualTo(@50);
      make.height.mas_lessThanOrEqualTo(@50);
    }];
    
    [self.name mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.headimg.mas_right).with.offset(10);
        make.top.equalTo(self.contentView.mas_top).with.offset(5);
        make.height.equalTo(@40);
        make.right.equalTo(self.contentView.mas_right).with.offset(-5);
    }];
    
    
    [self.summary mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView.mas_left).with.offset(10);
        make.top.equalTo(self.headimg.mas_bottom).with.offset(5);
        make.right.equalTo(self.contentView.mas_right).with.offset(-10);
        make.bottom.equalTo(self.img.mas_top).with.offset(0);

    }];
    [self.img mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView.mas_left).with.offset(10);
        make.top.equalTo(self.summary.mas_bottom).with.offset(0);
        make.right.equalTo(self.contentView.mas_right).with.offset(-10);
        make.height.mas_lessThanOrEqualTo(@200);
        make.bottom.equalTo(self.bottomView.mas_top).with.offset(10);
        
    }];
    [self.bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView.mas_left).with.offset(10);
        make.right.equalTo(self.contentView.mas_right).with.offset(-10);
        make.bottom.equalTo(self.contentView.mas_bottom).with.offset(-5);
    }];
        
     [self.date mas_makeConstraints:^(MASConstraintMaker *make) {
         make.left.equalTo(self.bottomView.mas_left).with.offset(10);
         make.top.equalTo(self.bottomView.mas_top).with.offset(5);
         make.bottom.equalTo(self.bottomView.mas_bottom).with.offset(-5);
         make.right.equalTo(self.hot.mas_left).with.offset(-5);
        
     }];
        self.date.backgroundColor = [UIColor blueColor];
        
     [self.hot mas_makeConstraints:^(MASConstraintMaker *make) {
         
         make.top.equalTo(self.bottomView.mas_top).with.offset(5);
         make.right.equalTo(self.like.mas_left).with.offset(-5);
         make.bottom.equalTo(self.bottomView.mas_bottom).with.offset(-5);
     }];
        self.hot.backgroundColor = [UIColor yellowColor];
        
     [self.like mas_makeConstraints:^(MASConstraintMaker *make) {
         make.top.equalTo(self.bottomView.mas_top).with.offset(5);
         make.right.equalTo(self.bottomView.mas_right).with.offset(-5);
         make.bottom.equalTo(self.bottomView.mas_bottom).with.offset(-5);
     }];
        self.like.backgroundColor = [UIColor redColor];
        
        [self.date setContentCompressionResistancePriority:UILayoutPriorityDefaultLow forAxis:UILayoutConstraintAxisHorizontal];
        [self.hot setContentCompressionResistancePriority:UILayoutPriorityDefaultHigh forAxis:UILayoutConstraintAxisHorizontal];
        [self.like setContentCompressionResistancePriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisHorizontal];
       
        
    }
     self.didSetupConstraints = YES;
    [super updateConstraints];
}

-(void)layoutSubviews{

    [super layoutSubviews];
    [self.contentView setNeedsLayout];
    [self.contentView layoutIfNeeded];
    self.summary.preferredMaxLayoutWidth = CGRectGetWidth(self.summary.frame);
    
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)setData:(Person *)person{
    self.name.text = person.name;
    self.headimg.image = [UIImage imageNamed:@"bee_00_coughing"];
    self.summary.text = person.summery;
    self.img.image = [UIImage imageNamed:person.imgUrl];
    self.date.text = person.date;
    self.like.text = person.like;
    self.hot.text = person.hot;
    
    NSLog(@"date****%lf",self.date.intrinsicContentSize.width);
    NSLog(@"like****%lf",self.like.intrinsicContentSize.width);
    NSLog(@"hot****%lf",self.hot.intrinsicContentSize.width);
}

@end
