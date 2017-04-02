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

+ (unsigned long long) fibonacciWithNumber: (long)number {
    if (number < 0) {
        [NSException raise:@"Invalid argument"
                    format:@"fibonacci number cannot be calculated for %ld", number];
    }
    
    if (number == 0 || number == 1) {
        return number;
    }
    
    unsigned long long fn1 = 1, fn2 = 0, fn = 0;
    for (long i = 2; i < number + 1; ++i) {
        if (fn1 > ULLONG_MAX - fn2) {
            [NSException raise:@"Type overflow"
                        format:@"fibonacci number too much for n = %ld", number];
        }
        
        fn = fn1 + fn2;
        
        fn2 = fn1;
        fn1 = fn;
    }
    
    return fn;
}

@end
