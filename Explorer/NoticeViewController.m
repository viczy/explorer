//
//  NoticeViewController.m
//  Explorer
//
//  Created by Lanvige Jiang on 1/6/13.
//  Copyright (c) 2013 Lanvige Jiang. All rights reserved.
//

// http://www.cnblogs.com/lovecode/articles/2238309.html
// http://www.devdiv.com/home.php?mod=space&uid=39974&do=blog&id=2573

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

    // Change the bar's style.
    self.navigationController.navigationBar.barStyle = UIBarStyleBlackOpaque;
    self.navigationItem.title = NSLocalizedString(@"notice", @"");

    // 初始化表中数组
    self.listData = @[@"Sleepy", @"Sneezy", @"Bashful", @"Happy", @"Grumpy",@"Dopey", @"Thorin", @"Dorin", @"Nori", @"Ori", @"Balin", @"Dwalin", @"Fili", @"Kili", @"Oin", @"Gloin", @"Bofur",@"Bombur"];


    CGRect navBarFrame = self.navigationController.navigationBar.frame;
    CGRect tabBarFrame = self.tabBarController.tabBar.frame;
    
    CGRect r = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height - navBarFrame.size.height - tabBarFrame.size.height);
    self.tableView = [[UITableView alloc] initWithFrame:r
                                                  style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;

    [self.view addSubview:self.tableView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark -
#pragma mark Table DataSource Delegate

//- (NSInteger)tableView:(UITableView *)tableView
//    sectionForSectionIndexTitle:(NSString *)title
//               atIndex:(NSInteger)index
//{
//    return 1;
//}

// 返回多少个section
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

//返回行数，也就是返回数组中所存储数据，也就是section的元素
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.listData count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0.0;
}

// 每个cell显示的内容
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *cellIndentifier = [NSString stringWithFormat:@"cell_%d", indexPath.row];
//    NoticeTableViewCell *cell = (NoticeTableViewCell *)[tableView cellForRowAtIndexPath:indexPath];

    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIndentifier];
    
    if (cell == nil) {
        cell = [[NoticeTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIndentifier notice:nil];
    }

    return cell;


//    // 声明静态字符串型对象，用来标记重用单元格
//    static NSString *TableSampleIdentifier = @"TableSampleIdentifier";
//    // 用TableSampleIdentifier表示需要重用的单元
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:TableSampleIdentifier];
//    
//    // 如果如果没有多余单元，则需要创建新的单元
//    if (cell == nil) {
//        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:TableSampleIdentifier];
//    } else {
//        while ([cell.contentView.subviews lastObject ]!=nil) {
//            [(UIView*)[cell.contentView.subviews lastObject]removeFromSuperview];
//        }
//    }
//    //    获取当前行信息值
//    NSUInteger row = [indexPath row];
//    //    填充行的详细内容
//    cell.detailTextLabel.text = @"详细内容";
//    //    把数组中的值赋给单元格显示出来
//    cell.textLabel.text=[self.listData objectAtIndex:row];
//
//
//    //    cell.textLabel.backgroundColor= [UIColor greenColor];
//
//    //    表视图单元提供的UILabel属性，设置字体大小
//
//    /*
//     cell.textLabel.backgroundColor = [UIColor clearColor];
//     UIView *backgroundView = [[UIView alloc] initWithFrame:cell.frame];
//     backgroundView.backgroundColor = [UIColor greenColor];
//     cell.backgroundView=backgroundView;
//     */
//    //    设置单元格UILabel属性背景颜色
//    cell.textLabel.backgroundColor=[UIColor clearColor];
//    //    正常情况下现实的图片
//    UIImage *image = [UIImage imageNamed:@"2.png"];
//    cell.imageView.image=image;
//
//    //    被选中后高亮显示的照片
//    UIImage *highLightImage = [UIImage imageNamed:@"1.png"];
//    cell.imageView.highlightedImage = highLightImage;
    return cell;
}


// 动态设置行高
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NoticeTableViewCell *cell = (NoticeTableViewCell *)[self tableView:tableView cellForRowAtIndexPath:indexPath];
    return cell.frame.size.height;
}

// 设置单元格缩进
//- (NSInteger) tableView:(UITableView *)tableView indentationLevelForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    NSInteger row = [indexPath row];
//    if (row % 2==0) {
//        return 0;
//    }
//    return 2;
//}

# pragma mark -
# pragma mark Table delegate

- (NSIndexPath *)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    return indexPath;
}


// 选中单元格所产生事件
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // 首先是用indexPath获取当前行的内容
    NSInteger row = [indexPath row];
    // 从数组中取出当前行内容
    NSString *rowValue = [self.listData objectAtIndex:row];
    NSString *message = [[NSString alloc] initWithFormat:@"You selected%@",rowValue];
    
    // 弹出警告信息
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"提示"
                                                   message:message
                                                  delegate:self
                                         cancelButtonTitle:@"OK"
                                         otherButtonTitles: nil];
//    [alert show];
    
    // After one second, unselect the current row
    [self performSelector:@selector(unselectCurrentRow)
               withObject:nil afterDelay:.1f];
}

// 取消Cell的选中
- (void)unselectCurrentRow
{
    // Animate the deselection
    [self.tableView deselectRowAtIndexPath:[self.tableView indexPathForSelectedRow] animated:YES];
}


@end
