//
//  ViewController.h
//  BasicAlgorithms
//
//  Created by Andrey Arzhannikov on 01.04.17.
//  Copyright © 2017 Handsome. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BasicAlgorithms.h"

@interface ViewController : UIViewController {
    UIActivityIndicatorView *spinner;
}

@property (weak, nonatomic) IBOutlet UITextField *fibonacciTextField;
@property (weak, nonatomic) IBOutlet UIButton *calculateButton;
@property (weak, nonatomic) IBOutlet UILabel *fibonacciValueLabel;

- (IBAction)calculateDidPress:(UIButton *)sender;

@end

