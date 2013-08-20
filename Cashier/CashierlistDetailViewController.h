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

@protocol CashierlistDetailViewControllerDelegate <NSObject>

-(void)cashierlistDetailViewControllerDidCancel:(CashierlistDetailViewController *)controller;
-(void)cashierlistDetailViewController:(CashierlistDetailViewController *)controller didFinishAddingItem:(Cashierlist *)item;
-(void)cashierlistDetailViewController:(CashierlistDetailViewController *)controller didFinishEditingItem:(Cashierlist *)item;

@end

@interface CashierlistDetailViewController : UITableViewController <UITextFieldDelegate>

@property (nonatomic, weak) id <CashierlistDetailViewControllerDelegate> delegate;
@property (nonatomic, strong) IBOutlet UITextField *textField;
@property (nonatomic, strong) IBOutlet UIBarButtonItem *doneBarButton;
@property (nonatomic, strong) Cashierlist *cashierListToEdit;

-(IBAction)cancel;
-(IBAction)done;

@end
