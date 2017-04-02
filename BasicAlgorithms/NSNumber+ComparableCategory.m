//
//  NSNumber+ComparableCategory.m
//  BasicAlgorithms
//
//  Created by Andrey Arzhannikov on 02.04.17.
//  Copyright © 2017 Handsome. All rights reserved.
//

#import "NSNumber+ComparableCategory.h"

@implementation NSNumber (ComparableCategory)

-(NSComparisonResult) compareTo: (id)object {
    return [self compare:object];
}

@end
