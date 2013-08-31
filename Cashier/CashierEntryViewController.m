//
//  CashierEntryViewController.m
//  Cashier
//
//  Created by Claus Guttesen on 11/08/13.
//  Copyright (c) 2013 Claus Guttesen. All rights reserved.
//

#import "CashierEntryViewController.h"
#import "Cashierlist.h"
#import "CashierEntry.h"

@interface CashierEntryViewController ()

@end

@implementation CashierEntryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = self.cashierlist.text;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)configureTextForCell:(UITableViewCell *)cell withCashierlistEntry:(CashierEntry *)entry
{
    UILabel *label = (UILabel *)[cell viewWithTag:1000];
    label.text = entry.text;
}

#pragma mark - Delegate protocol
-(void)cashierEntryDetailViewController:(CashierEntryDetailViewController *)controller didFinishAddingEntry:(CashierEntry *)entry
{
    int newRowIndex = [self.cashierlist.entries count];
    [self.cashierlist.entries addObject:entry];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:newRowIndex inSection:0];
    NSArray *indexPaths = [NSArray arrayWithObject:indexPath];
    [self.tableView insertRowsAtIndexPaths:indexPaths withRowAnimation:UITableViewRowAnimationAutomatic];
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)cashierEntryDetailViewController:(CashierEntryDetailViewController *)controller didFinishEditingEntry:(CashierEntry *)entry
{
    int index = [self.cashierlist.entries indexOfObject:entry];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:index inSection:0];
    UITableViewCell *cell = [self.tableView cellForRowAtIndexPath:indexPath];
    [self configureTextForCell:cell withCashierlistEntry:entry];
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.cashierlist.entries count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CashierlistEntry"];
    CashierEntry *entry = [self.cashierlist.entries objectAtIndex:indexPath.row];
    [self configureTextForCell:cell withCashierlistEntry:entry];
    return cell;
}

-(void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath
{
    CashierEntry *entry = [self.cashierlist.entries objectAtIndex:indexPath.row];
    [self performSegueWithIdentifier:@"EditCashierEntry" sender:entry];
}

-(void)cashierEntryDetailViewControllerDidCancel:(CashierEntryDetailViewController *)controller
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"AddCashierEntry"]) {
        UINavigationController *navigationController = segue.destinationViewController;
        CashierEntryDetailViewController *controller = (CashierEntryDetailViewController *)navigationController.topViewController;
        controller.delegate = self;
    } else if ([segue.identifier isEqualToString:@"EditCashierEntry"]) {
        UINavigationController *navigationController = segue.destinationViewController;
        CashierEntryDetailViewController *controller = (CashierEntryDetailViewController *)navigationController.topViewController;
        controller.delegate = self;
        controller.entryToEdit = sender;
    }
}

@end
