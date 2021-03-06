//
//  CashierViewController.h
//  Cashier
//
//  Created by Claus Guttesen on 04/08/13.
//  Copyright (c) 2013 Claus Guttesen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CashierlistDetailViewController.h"
#import "CashierEntryViewController.h"
#import "DataModel.h"

@interface CashierlistViewController : UITableViewController <CashierlistDetailViewControllerDelegate>

@property (nonatomic, strong) DataModel *dataModel;

@end
