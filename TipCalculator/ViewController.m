//
//  ViewController.m
//  TipCalculator
//
//  Created by Trevor MacGregor on 2017-03-17.
//  Copyright © 2017 Trevor MacGregor. All rights reserved.
//

#import "ViewController.h"


@interface ViewController ()


@property (strong, nonatomic) IBOutlet UITextField *billAmountTextField;
- (IBAction)calculateTipPressed:(id)sender;

@property (strong, nonatomic) IBOutlet UILabel *tipAmountLabel;
@property (strong, nonatomic) IBOutlet UITextField *tipPercentageTextField;


@property (nonatomic) NSString *amount;
@property (nonatomic) NSString *tipAmount;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.billAmountTextField.delegate = self;
    self.tipPercentageTextField.delegate = self;
    [self setUpTextField];
    self.tipAmountLabel.text = @" ";
    
    
    
    
}

- (void)setUpTextField
{
    ///set up keyboard type
    self.billAmountTextField.keyboardType = UIKeyboardTypeDefault;
    self.billAmountTextField.clearButtonMode = UITextFieldViewModeUnlessEditing;
    
}





- (IBAction)calculateTipPressed:(id)sender {
    
    ///can't do == comparison here
    if ([self.tipPercentageTextField.text isEqualToString:@""]) {
        
        //converts bill total to a float
        NSString *billTotal = self.billAmountTextField.text;
        float billValue = [billTotal floatValue];
        
        //calculate default tip percentage
        float tipAmountDefault = billValue * 0.15;
        NSString *tipResultDefault = [NSString stringWithFormat:@"$%0.2f",tipAmountDefault];
        self.tipAmountLabel.text = tipResultDefault;
    
    }else{
        
        //converts bill total to a float
        NSString *billTotal = self.billAmountTextField.text;
        float billValue = [billTotal floatValue];
        
    //converts percent text to a float
    NSString *percentText = self.tipPercentageTextField.text;
    float percentValue = [percentText floatValue];
    
    //calculates tip and puts it into tipPercentageTextField
    float tipAmount = billValue * percentValue * 0.01;
    NSString *tipResult = [NSString stringWithFormat:@"$%0.2f", tipAmount];
    self.tipAmountLabel.text = tipResult;
    }
    
}
@end
