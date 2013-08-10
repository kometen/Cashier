//
//  AddItemViewController.m
//  Cashier
//
//  Created by Claus Guttesen on 06/08/13.
//  Copyright (c) 2013 Claus Guttesen. All rights reserved.
//

#import "AddItemViewController.h"
#import "CashierItem.h"

@interface AddItemViewController ()

@end

@implementation AddItemViewController

- (id)initWithStyle:(UITableViewStyle)style {
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    if (self.itemToEdit != nil) {
        self.title = @"Edit Item";
        self.textField.text = self.itemToEdit.text;
        self.doneBarButton.enabled = YES;
    }
    
    [self.textField becomeFirstResponder];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)cancel {
    [self.delegate addItemViewControllerDidCancel:self];
}

-(IBAction)done {
    if (self.itemToEdit == nil) {
        CashierItem *item = [[CashierItem alloc] init];
        item.text = self.textField.text;
        [self.delegate addItemViewController:self didFinishAddingItem:item];
    } else {
        self.itemToEdit.text = self.textField.text;
        [self.delegate addItemViewController:self didFinishEditingItem:self.itemToEdit];
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
