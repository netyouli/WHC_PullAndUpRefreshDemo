# WHC_PullAndUpRefreshDemo
/*
*  qq:712641411
*  iOS大神qq群:460122071
*/

世上最牛逼的列表上拉下拉刷新效果！

##运行效果
![image](https://github.com/netyouli/WHC_PullAndUpRefreshDemo/tree/master/WHC_PullAndUpRefreshDemo/whc.gif)

####Use Example
```objective-c
[tableView setWHCRefreshStyle:AllStyle delegate:self];

//实现刷新回调代理
- (void)WHCUpPullRequest{
    NSLog(@"开始加载更多");
}

- (void)WHCDownPullRequest{
    NSLog(@"开始请求数据");
}

```