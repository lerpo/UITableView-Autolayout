//
//  ViewController.m
//  AutoLayoutTest
//
//  Created by apple on 16/5/7.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"
#import "PersonTableCellTableViewCell.h"
static NSString *CellIdentifier = @"CellIdentifier";
@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic ,strong) UITableView *tableView;

@property(nonatomic ,copy) NSMutableArray *dataSource;

@property (strong, nonatomic) NSMutableDictionary *offscreenCells;

@end

@implementation ViewController

-(UITableView *)tableView
{
  if(_tableView == nil)
  {
      _tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
      _tableView.estimatedRowHeight = UITableViewAutomaticDimension;
      _tableView.estimatedRowHeight = 44.0;
      _tableView.delegate = self;
      _tableView.dataSource = self;
      
  }
    return _tableView;
}

-(NSMutableDictionary *)offscreenCells{
    if(_offscreenCells==nil){
        _offscreenCells = [NSMutableDictionary dictionary];
    }
    return _offscreenCells;
}

-(NSMutableArray *)dataSource{
    
    if(_dataSource == nil){
        
        _dataSource = [[NSMutableArray alloc] initWithCapacity:10];
       
    }
    return _dataSource;
    
}

-(void)dataSorces{
    Person *person = [[Person alloc] initWithName:@"天ttan"
                                          summary:@"我是7个月大的宝宝，我喜欢听音乐看电视"
                                           imgUrl:@"bee_16_lunch"
                                           like:@"点赞:100000000000"
                                           hot:@"人气:100"
                                           date:@"2015-06-09 2015-06-09 2015-06-09"
                      ];
    [self.dataSource addObject:person];
    
    Person *person1 = [[Person alloc] initWithName:@"天ttan"
                                          summary:@"我是7个月大的宝宝，我喜欢听音乐看电视我是7个月大的宝宝，我喜欢听音乐看电视我是7个月大的宝宝，我喜欢听音乐看电视我是7个月大的宝宝，我喜欢听音乐看电视我是7个月大的宝宝，我喜欢听音乐看电视我是7个月大的宝宝，我喜欢听音乐看电视我是7个月大的宝宝，我喜欢听音乐看电视我是7个月大的宝宝，我喜欢听音乐看电视我是7个月大的宝宝，我喜欢听音乐看电视我是7个月大的宝宝，我喜欢听音乐看电视我是7个月大的宝宝，我喜欢听音乐看电视我是7个月大的宝宝，我喜欢听音乐看电视我是7个月大的宝宝，我喜欢听音乐看电视我是7个月大的宝宝，我喜欢听音乐看电视"
                                              imgUrl:@"bee_16_lunch"
                                              like:@"点赞:100"
                                               hot:@"人气:100000000000"
                                              date:@"2015-06-09"];
    [self.dataSource addObject:person1];

    
    Person *person2 = [[Person alloc] initWithName:@"天ttan"
                                          summary:@"我是7个月大的宝宝，我喜欢听音乐看电视"
                                           imgUrl:@""
                                              like:@"点赞:2300000000000000000"
                                               hot:@"人气:100000000000000000"
                                              date:@"2015-06-09"];
    [self.dataSource addObject:person2];

    
    Person *person3 = [[Person alloc] initWithName:@"天ttan"
                                          summary:@""
                                           imgUrl:@"bee_16_lunch"
                                              like:@"点赞:10"
                                               hot:@"人气:10"
                                              date:@"2015-06-09"];
    [self.dataSource addObject:person3];
    [self.dataSource addObject:person];
    [self.dataSource addObject:person1];
    [self.dataSource addObject:person2];
    [self.dataSource addObject:person3];
   
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.tableView];
     [self dataSorces];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataSource.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    PersonTableCellTableViewCell *cell  = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if(cell == nil){
        cell = [[PersonTableCellTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    Person *person = self.dataSource[indexPath.row];
    [cell setData:person];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
//  [cell setNeedsUpdateConstraints]; //
    [cell updateConstraintsIfNeeded];//立即触发约束更新，自动更新布局。

    return cell;
    
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    PersonTableCellTableViewCell *cell  = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if(cell == nil){
        cell = [[PersonTableCellTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    Person *person = self.dataSource[indexPath.row];
    [cell setData:person];
    
//  [cell setNeedsUpdateConstraints];
    [cell updateConstraintsIfNeeded];
    
    cell.bounds = CGRectMake(0.0f, 0.0f, CGRectGetWidth(tableView.bounds), CGRectGetHeight(cell.bounds));
//  [cell setNeedsLayout]; //而setNeedsLayout会默认调用layoutSubViews
    [cell layoutIfNeeded];
    
    CGFloat height = [cell.contentView systemLayoutSizeFittingSize:UILayoutFittingCompressedSize].height;
    height += 1;
    return height;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
