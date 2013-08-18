//
//  CashierlistDetailViewController.m
//  Cashier
//
//  Created by Claus Guttesen on 06/08/13.
//  Copyright (c) 2013 Claus Guttesen. All rights reserved.
//

#import "CashierlistDetailViewController.h"
#import "Cashierlist.h"

@interface CashierlistDetailViewController ()

@end

@implementation CashierlistDetailViewController

- (id)initWithStyle:(UITableViewStyle)style {
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    if (self.cashierListToEdit != nil) {
        self.title = @"Edit Item";
        self.textField.text = self.cashierListToEdit.text;
        self.doneBarButton.enabled = YES;
    }
    
    [self.textField becomeFirstResponder];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)cancel {
    [self.delegate cashierlistDetailViewControllerDidCancel:self];
}

-(IBAction)done {
    if (self.cashierListToEdit == nil) {
        Cashierlist *item = [[Cashierlist alloc] init];
        item.text = self.textField.text;
        [self.delegate cashierlistDetailViewController:self didFinishAddingItem:item];
    } else {
        self.cashierListToEdit.text = self.textField.text;
        [self.delegate cashierlistDetailViewController:self didFinishEditingItem:self.cashierListToEdit];
    }
}

-(NSIndexPath *)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    return nil;
}

-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    NSString *newText = [textField.text stringByReplacingCharactersInRange:range withString:string];
    self.doneBarButton.enabled = ([newText length] > 0);
    return YES;
}

@end
