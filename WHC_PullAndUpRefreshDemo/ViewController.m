//
//  ViewController.m
//  WHC_PullAndUpRefreshDemo
//
//  Created by 吴海超 on 15/7/24.
//  Copyright (c) 2015年 吴海超. All rights reserved.
//

/*
 *  qq:712641411
 *  iOSqq群:302157745
 *  gitHub:https://github.com/netyouli
 *  csdn:http://blog.csdn.net/windwhc/article/category/3117381
 */

#import "ViewController.h"

#define kCellHeight           (50.0)    //cell高度
#define kCellCount            (3)       //cell默认个数
@interface ViewController ()<WHC_PullRefreshDelegate>{
    NSInteger  _count;
}
@property (nonatomic , strong)IBOutlet  UITableView  * whcTV;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"XXX";
    [self initData];
    [_whcTV setWHCRefreshStyle:_refreshStyle delegate:self];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)initData{
    _count = kCellCount;
}

#pragma mark - WHC_PullRefreshDelegate

- (void)WHCUpPullRequest{
    NSLog(@"开始加载更多");
    _count+= 3;
    double delayInSeconds = 2.0;
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayInSeconds * NSEC_PER_SEC));
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
        [_whcTV reloadData];
        [_whcTV WHCDidCompletedWithRefreshIsDownPull:NO];
    });
}

- (void)WHCDownPullRequest{
    NSLog(@"上拉刷新");
    double delayInSeconds = 3.0;
    _count+= 3;
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayInSeconds * NSEC_PER_SEC));
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
        [_whcTV reloadData];
        [_whcTV WHCDidCompletedWithRefreshIsDownPull:YES];
    });
}

#pragma mark - UITableViewDelegate UITableViewDataSource

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return kCellHeight;
}


- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    return [UIView new];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell  * cell = [tableView dequeueReusableCellWithIdentifier:@"whc"];
    if(cell == nil){
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"whc"];
    }
    cell.textLabel.textColor = [UIColor redColor];
    cell.textLabel.font = [UIFont boldSystemFontOfSize:18];
    cell.textLabel.text = @"whc->iOS技术大牛群：460122071";
    return cell;
}



@end
