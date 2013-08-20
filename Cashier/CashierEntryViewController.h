//
//  CashierEntryViewController.h
//  Cashier
//
//  Created by Claus Guttesen on 11/08/13.
//  Copyright (c) 2013 Claus Guttesen. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Cashierlist;

@interface CashierEntryViewController : UITableViewController

@property (nonatomic, strong) Cashierlist *cashierlist;

@end
