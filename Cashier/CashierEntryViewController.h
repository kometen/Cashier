//
//  CashierEntryViewController.h
//  Cashier
//
//  Created by Claus Guttesen on 11/08/13.
//  Copyright (c) 2013 Claus Guttesen. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CashierEntryViewController;
@class CashierEntry;

@protocol CashierEntryViewControllerDelegate <NSObject>

-(void)cashierEntryViewControllerDidCancel:(CashierEntryViewController *)controller;
-(void)cashierEntryViewController:(CashierEntryViewController *)controller didFinishAddingEntry:(CashierEntry *)entry;
-(void)cashierEntryViewController:(CashierEntryViewController *)controller didFinishEditingEntry:(CashierEntry *)entry;

@end

@interface CashierEntryViewController : UITableViewController <UITextFieldDelegate>

@property (nonatomic, weak) id <CashierEntryViewControllerDelegate> delegate;
@property (nonatomic, strong) IBOutlet UITextField *textField;
@property (nonatomic, strong) IBOutlet UIBarButtonItem *doneBarButton;
@property (nonatomic, strong) CashierEntry *entryToEdit;

-(IBAction)cancel;
-(IBAction)done;

@end
