//
//  AddItemViewController.h
//  Cashier
//
//  Created by Claus Guttesen on 06/08/13.
//  Copyright (c) 2013 Claus Guttesen. All rights reserved.
//

#import <UIKit/UIKit.h>

@class AddItemViewController;
@class CashierItem;

@protocol AddItemViewControllerDelegate <NSObject>

-(void)addItemViewControllerDidCancel:(AddItemViewController *)controller;
-(void)addItemViewController:(AddItemViewController *)controller didFinishAddingItem:(CashierItem *)item;

@end

@interface AddItemViewController : UITableViewController <UITextFieldDelegate>

@property (nonatomic, strong) IBOutlet UITextField *textField;
@property (nonatomic, strong) IBOutlet UIBarButtonItem *doneBarButton;

-(IBAction)cancel;
-(IBAction)done;

@end
