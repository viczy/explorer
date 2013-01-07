//
//  NoticeViewController.m
//  Explorer
//
//  Created by Lanvige Jiang on 1/6/13.
//  Copyright (c) 2013 Lanvige Jiang. All rights reserved.
//

#import "NoticeViewController.h"

@interface NoticeViewController ()

@end

@implementation NoticeViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    self.tableView = [[UITableView alloc] init];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    [self.view addSubview:self.tableView];
    
    // 初始化表中数组
    self.notices = @[@"Sleepy", @"Sneezy", @"Bashful", @"Happy", @"Grumpy",@"Dopey", @"Thorin", @"Dorin", @"Nori", @"Ori", @"Balin", @"Dwalin", @"Fili", @"Kili", @"Oin", @"Gloin", @"Bofur",@"Bombur"];



    // Change the bar's style.
    self.navigationController.navigationBar.barStyle = UIBarStyleBlackOpaque;
    self.navigationItem.title = NSLocalizedString(@"notice", @"");
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark -
#pragma mark Table DataSource Delegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

//返回一个NsInterger作为行数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.notices count];
}

// 每个cell显示的内容
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
//    static NSString *SimpleTableIdentifier = @"SimpleTableIdentifier";
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:SimpleTableIdentifier];
//    if(cell == nil){
//        cell =  [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:SimpleTableIdentifier];
//    }
//
//    NSUInteger row = [indexPath row];
//    cell.textLabel.text = [self.notices objectAtIndex:row];
//    return cell;
    
    NSString *cellIndentifier = [NSString stringWithFormat:@"cell_%d", indexPath.row];
    NoticeCell *cell = (NoticeCell *)[tableView cellForRowAtIndexPath:indexPath];
    
    if (cell == nil) {
        cell = [[NoticeCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIndentifier notice:nil];
    }
    
    return cell;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *username = @"Lanvige";
    NSString *content = @"今儿@上岸晒太阳的小摩 说要帮忙找人合租房子，想了一下，基本没有合适的且认识的女生可以介绍，，这个年龄段的认识的基本都结婚了或者有了自己的房子或者和老公一起租住，想想自己果然老了";
 
    // Calu line height.
    CGFloat contentWidth = 240.000;
    CGSize titleSize = [username sizeWithFont:[UIFont systemFontOfSize:15]
                            constrainedToSize:CGSizeMake(contentWidth, 10000)
                                lineBreakMode:UILineBreakModeWordWrap];
    CGSize contentSize = [content sizeWithFont:[UIFont systemFontOfSize:14]
                             constrainedToSize:CGSizeMake(contentWidth, 10000)
                                 lineBreakMode:UILineBreakModeWordWrap];
    
    CGFloat height = 5 + titleSize.height + 9 + contentSize.height + 5 + 14 + 10;
    
    return height;
}


# pragma mark -
# pragma mark Table delegate

- (NSIndexPath *)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    return indexPath;
}

// 设置每行缩进级别
//- (NSInteger)tableView:(UITableView *)tableView indentationLevelForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//}

- (NSInteger)tableView:(UITableView *)tableView sectionForSectionIndexTitle:(NSString *)title atIndex:(NSInteger)index
{
    return 1;
}

@end
