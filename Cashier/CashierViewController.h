//
//  CashierViewController.h
//  Cashier
//
//  Created by Claus Guttesen on 04/08/13.
//  Copyright (c) 2013 Claus Guttesen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AddItemViewController.h"

@interface CashierViewController : UITableViewController <AddItemViewControllerDelegate>

-(IBAction)addItem;

@end
