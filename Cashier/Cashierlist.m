//
//  Cashierlist.m
//  Cashier
//
//  Created by Claus Guttesen on 11/08/13.
//  Copyright (c) 2013 Claus Guttesen. All rights reserved.
//

#import "Cashierlist.h"

@implementation Cashierlist

-(id)init {
    if ((self = [super init])) {
        self.entries = [[NSMutableArray alloc] initWithCapacity:20];
    }
    return self;
}

@end
