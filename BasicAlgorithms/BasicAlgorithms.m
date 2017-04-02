//
//  Fibonacci.m
//  BasicAlgorithms
//
//  Created by Andrey Arzhannikov on 01.04.17.
//  Copyright © 2017 Handsome. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "BasicAlgorithms.h"

@implementation BasicAlgorithms

+ (int) fibonacciWithNumber: (int)number {
    if (number < 0) {
        [NSException raise:@"Invalid argument"
                    format:@"fibonacci number cannot be calculated for %d ", number];
    }
    
    if (number == 0 || number == 1) {
        return number;
    }
    
    int fn1 = 1, fn2 = 0, fn = 0;
    for (int i = 2; i < number + 1; ++i) {
        fn = fn1 + fn2;
        fn2 = fn1;
        fn1 = fn;
    }
    
    return fn;
}

@end
