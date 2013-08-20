//
//  Cashierlist.h
//  Cashier
//
//  Created by Claus Guttesen on 11/08/13.
//  Copyright (c) 2013 Claus Guttesen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Cashierlist : NSObject <NSCoding>

@property (nonatomic, strong) NSString *text;
@property (nonatomic, strong) NSMutableArray *entries;

@end
