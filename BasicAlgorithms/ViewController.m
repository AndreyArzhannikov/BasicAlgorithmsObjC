//
//  ViewController.m
//  BasicAlgorithms
//
//  Created by Andrey Arzhannikov on 01.04.17.
//  Copyright © 2017 Handsome. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}


- (IBAction)calculateDidPress:(UIButton *)sender {
    [self.view endEditing:YES];
    
    NSString *text = self.fibonacciTextField.text;
    
    if ([text length] == 0) {
        return;
    }
    
    long number =  [text longLongValue];
    
    [self showActivityIndicator];
    
    [self performAsyncWithBlock:^{
        
        @try {
            unsigned long long fibonacciResult = [BasicAlgorithms fibonacciWithNumber:number];
            
            dispatch_sync(dispatch_get_main_queue(), ^{
                self.fibonacciValueLabel.text = [NSString stringWithFormat:@"Fibonacci Value: %llu", fibonacciResult];
                [self hideActivityIndicatorIfNeeded];
            });
        }
        @catch (NSException * e) {
            dispatch_sync(dispatch_get_main_queue(), ^{
                self.fibonacciValueLabel.text = [NSString stringWithFormat:@"%@", [e reason]];
                [self hideActivityIndicatorIfNeeded];
            });
        }
    }];
}

- (IBAction)bubbleSortDidPress:(UIButton *)sender {
    NSMutableArray<Comparable> * array = [[NSMutableArray<Comparable> alloc] init];
    for (int i = 0; i < 7; ++i) {
        int randomIntValue = arc4random_uniform(20);
        [array addObject: [NSNumber numberWithInt:randomIntValue]];
    }
    
    [self printArray: array];
    
    [self performAsyncWithBlock:^{
        [BasicAlgorithms bubbleSortWithArray:array];
        dispatch_sync(dispatch_get_main_queue(), ^{
            [self printArray:array];
        });
    }];
}


- (void)performAsyncWithBlock: ( void (^)(void) )computationBlock {
    unsigned long flags = 0;
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, flags);
    dispatch_async(queue, computationBlock);
}


- (void)showActivityIndicator {
    spinner = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    
    CGPoint viewCenter = CGPointMake(self.view.frame.size.width/2, self.view.frame.size.height/2);
    [spinner setCenter:viewCenter];
    [self.view addSubview:spinner];
    [self.view layoutIfNeeded];
    [spinner startAnimating];
}


- (void)hideActivityIndicatorIfNeeded {
    if (spinner != nil) {
        [spinner stopAnimating];
        [spinner hidesWhenStopped];
    }
}

- (void)printArray:(NSArray*)array {
    NSLog(@"-----");
    for (int i = 0; i < [array count]; ++i) {
        NSLog(@"%@", array[i]);
    }
    NSLog(@"-----");
}

@end
