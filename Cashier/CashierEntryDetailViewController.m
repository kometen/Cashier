//
//  CashierEntryDetailViewController.m
//  Cashier
//
//  Created by Claus Guttesen on 21/08/13.
//  Copyright (c) 2013 Claus Guttesen. All rights reserved.
//

#import "CashierEntryDetailViewController.h"
#import "CashierEntry.h"

@interface CashierEntryDetailViewController ()

@end

@implementation CashierEntryDetailViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    if (self.entryToEdit != nil) {
        NSLog(@"entryToEdit: %@", self.entryToEdit.text);
        self.title = @"Edit Entry";
        self.textField.text = self.entryToEdit.text;
    }
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.textField becomeFirstResponder];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)cancel
{
    [self.delegate cashierEntryDetailViewControllerDidCancel:self];
}

-(IBAction)done
{
    if (self.entryToEdit == nil) {
        CashierEntry *entry = [[CashierEntry alloc] init];
        entry.text = self.textField.text;
        [self.delegate cashierEntryDetailViewController:self didFinishAddingEntry:entry];
    }
}

-(NSIndexPath *)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    return nil;
}

#pragma mark - UITextFieldDelegate

-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    NSString *newText = [textField.text stringByReplacingCharactersInRange:range withString:string];
    self.doneBarButton.enabled = ([newText length] > 0);
    return YES;
}

@end
