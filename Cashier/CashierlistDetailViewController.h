//
//  CashierlistDetailViewController.h
//  Cashier
//
//  Created by Claus Guttesen on 06/08/13.
//  Copyright (c) 2013 Claus Guttesen. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CashierlistDetailViewController;
@class Cashierlist;

@protocol ItemDetailViewControllerDelegate <NSObject>

-(void)itemDetailViewControllerDidCancel:(CashierlistDetailViewController *)controller;
-(void)itemDetailViewController:(CashierlistDetailViewController *)controller didFinishAddingItem:(Cashierlist *)item;
-(void)itemDetailViewController:(CashierlistDetailViewController *)controller didFinishEditingItem:(Cashierlist *)item;

@end

@interface CashierlistDetailViewController : UITableViewController <UITextFieldDelegate>

@property (nonatomic, weak) id <ItemDetailViewControllerDelegate> delegate;
@property (nonatomic, strong) IBOutlet UITextField *textField;
@property (nonatomic, strong) IBOutlet UIBarButtonItem *doneBarButton;
@property (nonatomic, strong) Cashierlist *itemToEdit;

-(IBAction)cancel;
-(IBAction)done;

@end
