//
//  CashierEntryDetailViewController.h
//  Cashier
//
//  Created by Claus Guttesen on 21/08/13.
//  Copyright (c) 2013 Claus Guttesen. All rights reserved.
//

#import <UIKit/UIKit.h>

#define MAX_LENGTH 8

@class CashierEntryDetailViewController;
@class CashierEntry;

@protocol CashierEntryDetailViewControllerDelegate <NSObject>
-(void)cashierEntryDetailViewControllerDidCancel:(CashierEntryDetailViewController *)controller;
-(void)cashierEntryDetailViewController:(CashierEntryDetailViewController *)controller didFinishAddingEntry:(CashierEntry *)entry;
-(void)cashierEntryDetailViewController:(CashierEntryDetailViewController *)controller didFinishEditingEntry:(CashierEntry *)entry;
@end

@interface CashierEntryDetailViewController : UITableViewController <UITextFieldDelegate>

@property (nonatomic, strong) IBOutlet UITextField *textField;
@property (nonatomic, strong) IBOutlet UIBarButtonItem *doneBarButton;
@property (nonatomic, weak) id <CashierEntryDetailViewControllerDelegate> delegate;
@property (nonatomic, strong) CashierEntry *entryToEdit;
@property (nonatomic, assign) int maximumFractionDigits;
@property (nonatomic, strong) NSString *decimalSeparator;

-(IBAction)cancel;
-(IBAction)done;

@end
