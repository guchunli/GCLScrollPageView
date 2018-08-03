//
//  ViewController.m
//  GCLScrollPageView
//
//  Created by gcl on 2018/7/31.
//  Copyright © 2018年 gcl. All rights reserved.
//

#import "ViewController.h"
#import "ChildViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 添加所有子控制器
    [self setUpAllViewController];
    
//    // 模仿网络延迟，0.2秒后，才知道有多少标题
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//
//        // 移除之前所有子控制器
//        [self.childViewControllers makeObjectsPerformSelector:@selector(removeFromParentViewController)];
//
//        // 把对应标题保存到控制器中，并且成为子控制器，才能刷新
//        // 添加所有新的子控制器
//        [self setUpAllViewController];
//
//        // 注意：必须先确定子控制器
//        [self refreshDisplay];
//
//    });
}

// 添加所有子控制器
- (void)setUpAllViewController
{
    NSArray *titles = @[@"推荐",@"热点",@"视频",@"中国好声音",@"数码",@"头条号",@"房产",@"奥运会",@"时尚"];
    for (int i = 0; i<titles.count; i++) {
        ChildViewController *vc = [[ChildViewController alloc]init];
        vc.title = titles[i];
        [self addChildViewController:vc];
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
