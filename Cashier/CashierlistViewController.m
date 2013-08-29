//
//  CashierViewController.m
//  Cashier
//
//  Created by Claus Guttesen on 04/08/13.
//  Copyright (c) 2013 Claus Guttesen. All rights reserved.
//
//


#import "CashierlistViewController.h"
#import "Cashierlist.h"

@interface CashierlistViewController ()

@end

@implementation CashierlistViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(id)initWithCoder:(NSCoder *)aDecoder {
    if ((self = [super initWithCoder:aDecoder])) {
        self.dataModel = [[DataModel alloc] init];
    }
    return self;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.dataModel.lists count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CashierItem"];
    
    Cashierlist *cashierlist = [self.dataModel.lists objectAtIndex:indexPath.row];
    
    UILabel *label = (UILabel *)[cell viewWithTag:1000];
    label.text = cashierlist.text;
    
    return cell;
}

-(void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath {
    UINavigationController *navigationController = [self.storyboard instantiateViewControllerWithIdentifier:@"CashierlistNavigationController"];
    CashierlistDetailViewController *controller = (CashierlistDetailViewController *)navigationController.topViewController;
    controller.delegate = self;
    Cashierlist *cashierlist = [self.dataModel.lists objectAtIndex:indexPath.row];
    controller.cashierListToEdit = cashierlist;
    [self presentViewController:navigationController animated:YES completion:nil];
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    Cashierlist *cashierlist = [self.dataModel.lists objectAtIndex:indexPath.row];
    [self performSegueWithIdentifier:@"ShowCashierlist" sender:cashierlist];
}

-(void)configureTextForCell:(UITableViewCell *)cell withCashierItem:(Cashierlist *)item {
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

// CashierlistDetailViewControllerDelegate
-(void)cashierlistDetailViewControllerDidCancel:(CashierlistDetailViewController *)controller {
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)cashierlistDetailViewController:(CashierlistDetailViewController *)controller didFinishAddingItem:(Cashierlist *)item {
    int newRowIndex = [self.dataModel.lists count];
    [self.dataModel.lists addObject:item];
    
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:newRowIndex inSection:0];
    NSArray *indexPaths = [NSArray arrayWithObject:indexPath];
    [self.tableView insertRowsAtIndexPaths:indexPaths withRowAnimation:UITableViewRowAnimationAutomatic];
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)cashierlistDetailViewController:(CashierlistDetailViewController *)controller didFinishEditingItem:(Cashierlist *)item {
    int index = [self.dataModel.lists indexOfObject:item];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:index inSection:0];
    UITableViewCell *cell = [self.tableView cellForRowAtIndexPath:indexPath];
    [self configureTextForCell:cell withCashierItem:item];
    [self dismissViewControllerAnimated:YES completion:nil];
}

// CashierEntryViewControllerDelegate
-(void)cashierEntryViewControllerDidCancel:(CashierEntryViewController *)controller {
    [self dismissViewControllerAnimated:YES completion:nil];
}



-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"AddCashierlist"]) {
        UINavigationController *navigationController = segue.destinationViewController;
        CashierlistDetailViewController *controller = (CashierlistDetailViewController *)navigationController.topViewController;
        controller.delegate = self;
    } else if ([segue.identifier isEqualToString:@"ShowCashierlist"]) {
        CashierEntryViewController *controller = segue.destinationViewController;
        controller.cashierlist = sender;
    }
}

@end
