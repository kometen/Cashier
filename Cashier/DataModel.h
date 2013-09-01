//
//  DataModel.h
//  Cashier
//
//  Created by Claus Guttesen on 12/08/13.
//  Copyright (c) 2013 Claus Guttesen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DataModel : NSObject

extern NSString *filename;
extern NSString *fileextension;
extern NSString *file;

@property (nonatomic, strong) NSMutableArray *lists;

-(void)saveCashierlists;

@end
