//
//  ChildViewController.m
//  GCLScrollPageView
//
//  Created by gcl on 2018/7/31.
//  Copyright © 2018年 gcl. All rights reserved.
//

#import "ChildViewController.h"
#import "TestViewController.h"


@interface ChildViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView *tabView;
@property (nonatomic, strong) NSArray *dataSource;

@end

@implementation ChildViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self loadData];
}

- (void)loadData{
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        [self.view addSubview:self.tabView];
    });
}

-(UITableView *)tabView{
    if (!_tabView) {
        _tabView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
        _tabView.dataSource = self;
        _tabView.delegate = self;
    }
    return _tabView;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *cid = @"cid";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cid];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cid];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"%@ 第%ld行",self.title,indexPath.row];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    TestViewController *testVC = [[TestViewController alloc]init];
    [self.navigationController pushViewController:testVC animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
