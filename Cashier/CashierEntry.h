//
//  CashierDetail.h
//  Cashier
//
//  Created by Claus Guttesen on 11/08/13.
//  Copyright (c) 2013 Claus Guttesen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CashierEntry : NSObject <NSCoding>

@property (nonatomic, strong) NSString *text;
//@property (nonatomic, strong) NSDate *dateAdded;
@property (nonatomic, strong) NSString *comment;

@end
