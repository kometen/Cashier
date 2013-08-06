//
//  CashierViewController.m
//  Cashier
//
//  Created by Claus Guttesen on 04/08/13.
//  Copyright (c) 2013 Claus Guttesen. All rights reserved.
//

#import "CashierViewController.h"
#import "CashierItem.h"

@interface CashierViewController ()

@end

@implementation CashierViewController {
    NSMutableArray *items;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    items = [[NSMutableArray alloc] initWithCapacity:10];
    
    CashierItem *item;
    
    item = [[CashierItem alloc] init];
    item.text = @"Brændstof";
    [items addObject:item];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [items count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CashierItem"];
    
    CashierItem *item = [items objectAtIndex:indexPath.row];
    
    UILabel *label = (UILabel *)[cell viewWithTag:1000];
    label.text = item.text;
    
    return cell;
}

-(IBAction)addItem {
    int newRowIndex = [items count];
    
    CashierItem *item = [[CashierItem alloc] init];
    item.text = @"Ny række";
    [items addObject:item];
    
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:newRowIndex inSection:0];
    NSArray *indexPaths = [NSArray arrayWithObject:indexPath];
    [self.tableView insertRowsAtIndexPaths:indexPaths withRowAnimation:UITableViewRowAnimationAutomatic];
}

/* delete
-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    [items removeObjectAtIndex:indexPath.row];
    NSArray *indexPaths = [NSArray arrayWithObject:indexPath];
    [tableView deleteRowsAtIndexPaths:indexPaths withRowAnimation:UITableViewRowAnimationAutomatic];
}
delete */

@end
