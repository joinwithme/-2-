//
//  LeftViewController.m
//  侧边栏
//
//  Created by qianfeng on 15/8/1.
//  Copyright (c) 2015年 郭振伟. All rights reserved.
//

#import "LeftViewController.h"
#import "MainViewController.h"
#import "DDMenuController.h"
#import "AppDelegate.h"
#import "RightViewController.h"
@implementation LeftViewController
@synthesize tableView = _tableView;

-(id)init
{
    if (self = [super init]) {

    }
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.dataArr = [NSMutableArray arrayWithObjects:@"首页",@"日报",@"我的", nil];
//    self.vcNames = [NSMutableArray arrayWithObjects:@"LeftViewController",@"MainViewController",@"RightViewController", nil];
    if (!_tableView) {
        UITableView *tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
        tableView.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
        tableView.delegate = self;
        tableView.dataSource = self;
        [self.view addSubview:tableView];
        self.tableView = tableView;
    }
    
    
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataArr.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *str = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:str];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:str];
        
    }
    cell.textLabel.text = self.dataArr[indexPath.row];

    return cell;

}
-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    NSString *str = nil;

    return str;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 64;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    DDMenuController *menuController = (DDMenuController*)((AppDelegate*)[[UIApplication sharedApplication] delegate]).menuController;
    switch (indexPath.row) {
        case 0:
        {
            MainViewController *controller = [[MainViewController alloc] init];
            controller.title = self.dataArr[indexPath.row];
            UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:controller];
            
            [menuController setRootController:navController animated:YES];

        }
            break;
        case 1:
        {
            RightViewController *controller = [[RightViewController alloc] init];
            controller.title = self.dataArr[indexPath.row];
            UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:controller];
            
            [menuController setRootController:navController animated:YES];
            

        }
            break;
        case 2:
        {
            LeftViewController *controller = [[LeftViewController alloc] init];
            controller.title = self.dataArr[indexPath.row];
            UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:controller];
            
            [menuController setRootController:navController animated:YES];
            [tableView deselectRowAtIndexPath:indexPath animated:YES];

        }
            break;
        default:
            break;
    }
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}


@end
