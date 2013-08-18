//
//  DataModel.m
//  Cashier
//
//  Created by Claus Guttesen on 12/08/13.
//  Copyright (c) 2013 Claus Guttesen. All rights reserved.
//

#import "DataModel.h"

@implementation DataModel

-(NSString *)documentsDirectory {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    return documentsDirectory;
}

-(NSString *)dataFilePath {
    return [[self documentsDirectory] stringByAppendingPathComponent:@"Cashierlists.plist"];
}

-(void)saveCashierlists {
    NSMutableData *data = [[NSMutableData alloc] init];
    NSKeyedArchiver *archiver = [[NSKeyedArchiver alloc] initForWritingWithMutableData:data];
    [archiver encodeObject:self.lists forKey:@"Cashierlist"];
    [archiver finishEncoding];
    [data writeToFile:[self dataFilePath] atomically:YES];
}

-(void)loadCashierlists {
    NSString *path = [self dataFilePath];
    if ([[NSFileManager defaultManager] fileExistsAtPath:path]) {
        NSData *data = [[NSData alloc] initWithContentsOfFile:path];
        NSKeyedUnarchiver *unarchiver  = [[NSKeyedUnarchiver alloc] initForReadingWithData:data];
        self.lists = [unarchiver decodeObjectForKey:@"Cashierlists"];
        [unarchiver finishDecoding];
    } else {
        self.lists = [[NSMutableArray alloc] initWithCapacity:20];
    }
}

-(id)init {
    if ((self = [super init])) {
        [self loadCashierlists];
    }
    return self;
}

@end
