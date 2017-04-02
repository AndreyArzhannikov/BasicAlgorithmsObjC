//
//  Fibonacci.h
//  BasicAlgorithms
//
//  Created by Andrey Arzhannikov on 01.04.17.
//  Copyright © 2017 Handsome. All rights reserved.
//

#ifndef Fibonacci_h
#define Fibonacci_h

@protocol Comparable

-(NSComparisonResult) compareTo: (id)object;

@end

@interface BasicAlgorithms : NSObject

+ (unsigned long long) fibonacciWithNumber: (long) number;

+ (void) bubbleSortWithArray: (NSArray<Comparable> *)array;

@end

#endif /* Fibonacci_h */
