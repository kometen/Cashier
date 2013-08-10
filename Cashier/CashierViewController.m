//
//  CashierViewController.m
//  Cashier
//
//  Created by Claus Guttesen on 04/08/13.
//  Copyright (c) 2013 Claus Guttesen. All rights reserved.
//
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

-(void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath {
    CashierItem *item = [items objectAtIndex:indexPath.row];
    [self performSegueWithIdentifier:@"EditItem" sender:item];
}

-(void)configureTextForCell:(UITableViewCell *)cell withCashierItem:(CashierItem *)item {
    UILabel *label = (UILabel *)[cell viewWithTag:1000];
    label.text = item.text;
}

/* delete
-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    [items removeObjectAtIndex:indexPath.row];
    NSArray *indexPaths = [NSArray arrayWithObject:indexPath];
    [tableView deleteRowsAtIndexPaths:indexPaths withRowAnimation:UITableViewRowAnimationAutomatic];
}
delete */

-(void)addItemViewControllerDidCancel:(AddItemViewController *)controller {
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)addItemViewController:(AddItemViewController *)controller didFinishAddingItem:(CashierItem *)item {
    int newRowIndex = [items count];
    [items addObject:item];
    
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:newRowIndex inSection:0];
    NSArray *indexPaths = [NSArray arrayWithObject:indexPath];
    [self.tableView insertRowsAtIndexPaths:indexPaths withRowAnimation:UITableViewRowAnimationAutomatic];
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)addItemViewController:(AddItemViewController *)controller didFinishEditingItem:(CashierItem *)item {
    int index = [items indexOfObject:item];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:index inSection:0];
    UITableViewCell *cell = [self.tableView cellForRowAtIndexPath:indexPath];
    [self configureTextForCell:cell withCashierItem:item];
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"AddItem"]) {
        UINavigationController *navigationController = segue.destinationViewController;
        AddItemViewController *controller = (AddItemViewController *)navigationController.topViewController;
        controller.delegate = self;
    } else if ([segue.identifier isEqualToString:@"EditItem"]) {
        UINavigationController *navigationController = segue.destinationViewController;
        AddItemViewController *controller = (AddItemViewController *)navigationController.topViewController;
        controller.delegate = self;
        controller.itemToEdit = sender;
    }
}

@end
