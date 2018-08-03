//
//  HYViewController.m
//  test
//
//  Created by gcl on 2018/8/3.
//  Copyright © 2018年 gcl. All rights reserved.
//

#import "HYViewController.h"
#import "HYTabbarView.h"
#import "ChildViewController.h"

@interface HYViewController ()

@property (nonatomic, strong) HYTabbarView *tabbarView;

@end

@implementation HYViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    
    NSArray *titles = @[@"推荐",@"热点",@"视频",@"中国好声音",@"数码",@"头条号",@"房产",@"奥运会",@"时尚"];
    for (int i = 0; i<titles.count; i++) {
        ChildViewController *vc = [[ChildViewController alloc]init];
        vc.title = titles[i];
        /*
         注意：
         1.必须加到addChildViewController，否则ChildViewController中单元格的点击事件中push将无效
         2.如果在这里添加vc.view到scrollView上，将会调用ChildViewController的viewDidLoad方法，所以使用collectionView，显示cell时，vc.view才调用viewDidLoad
         */
        
        [self addChildViewController:vc];
//        [self.tabbarView addSubItemWithViewController:vc];
    }
    [self.view addSubview:self.tabbarView];
}

//懒加载
- (HYTabbarView *)tabbarView{
    
    if (!_tabbarView) {
        _tabbarView = ({
            
            HYTabbarView * tabbar = [[HYTabbarView alloc]initWithFrame:CGRectMake(0, 64, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height - 64) childVC:self.childViewControllers];
            
            tabbar;
        });
    }
    return _tabbarView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
