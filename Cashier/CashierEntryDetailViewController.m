//
//  CashierEntryDetailViewController.m
//  Cashier
//
//  Created by Claus Guttesen on 21/08/13.
//  Copyright (c) 2013 Claus Guttesen. All rights reserved.
//

#import "CashierEntryDetailViewController.h"
#import "CashierEntry.h"

@interface CashierEntryDetailViewController ()

@end

@implementation CashierEntryDetailViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    if (self.entryToEdit != nil) {
        self.title = @"Edit Entry";
        self.textField.text = self.entryToEdit.text;
    }
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    NSNumberFormatter *numberFormatter = [[NSNumberFormatter alloc] init];
    [numberFormatter setNumberStyle:NSNumberFormatterCurrencyStyle];
    [numberFormatter setCurrencyCode:@"NOK"];
    self.maximumFractionDigits = numberFormatter.maximumFractionDigits;
    self.decimalSeparator = numberFormatter.decimalSeparator;
    [self.textField becomeFirstResponder];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)cancel
{
    [self.delegate cashierEntryDetailViewControllerDidCancel:self];
}

-(IBAction)done
{
    if (self.entryToEdit == nil) {
        CashierEntry *entry = [[CashierEntry alloc] init];
        entry.text = self.textField.text;
        [self.delegate cashierEntryDetailViewController:self didFinishAddingEntry:entry];
    } else {
        self.entryToEdit.text = self.textField.text;
        [self.delegate cashierEntryDetailViewController:self didFinishEditingEntry:self.entryToEdit];
    }
}

-(NSIndexPath *)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    return nil;
}

#pragma mark - UITextFieldDelegate

-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
/*    NSString *newText = [textField.text stringByReplacingCharactersInRange:range withString:string];
    return YES;*/
    // github.com/mpatric/decimal-input/blob/master/DecimalInput/MyViewController.m
    UITextRange *selectedRange = [textField selectedTextRange];
    UITextPosition *start = textField.beginningOfDocument;
    NSInteger cursorOffset = [textField offsetFromPosition:start toPosition:selectedRange.start];
    NSMutableString *currentString = [NSMutableString stringWithString:textField.text];
    NSUInteger currentLength = currentString.length;
    [currentString replaceCharactersInRange:range withString:string];
    [currentString replaceOccurrencesOfString:self.decimalSeparator withString:@"" options:NSLiteralSearch range:NSMakeRange(0, [currentString length])];
    int currentValue = [currentString intValue];
    NSString *format = [NSString stringWithFormat:@"%%.%df", self.maximumFractionDigits];
    double minorUnitsPerMajor = pow(10, self.maximumFractionDigits);
    NSString *newString = [NSString stringWithFormat:format, currentValue / minorUnitsPerMajor];
    if (newString.length <= MAX_LENGTH) {
        textField.text = newString;
        if (cursorOffset != currentLength) {
            int lengthDelta = newString.length - currentLength;
            int newCursorOffset = MAX(0, MIN(newString.length, cursorOffset + lengthDelta));
            UITextPosition *newPosition = [textField positionFromPosition:textField.beginningOfDocument offset:newCursorOffset];
            UITextRange *newRange = [textField textRangeFromPosition:newPosition toPosition:newPosition];
            [textField setSelectedTextRange:newRange];
        }
    }
    self.doneBarButton.enabled = ([currentString length] > 0);
    return NO;
}

@end
