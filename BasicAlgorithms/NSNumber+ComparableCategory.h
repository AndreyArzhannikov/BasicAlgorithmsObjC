//
//  NSNumber+ComparableCategory.h
//  BasicAlgorithms
//
//  Created by Andrey Arzhannikov on 02.04.17.
//  Copyright © 2017 Handsome. All rights reserved.
//

#ifndef NSNumber_ComparableCategory_h
#define NSNumber_ComparableCategory_h
#import <Foundation/Foundation.h>
#import "BasicAlgorithms.h"


@interface NSNumber (ComparableCategory) <Comparable>

-(NSComparisonResult) compareTo: (id)object;

@end

#endif /* NSNumber_ComparableCategory_h */
