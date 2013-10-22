//
//  ProductDetail.m
//  BBShopper
//
//  Created by MFrengel on 10/22/13.
//  Copyright (c) 2013 MFrengel. All rights reserved.
//

#import "ProductDetail.h"

@implementation ProductDetail

-(Class) classTypeForKey:(NSString *)key {
    if ([key isEqualToString:SELF_KEYPATH(variations)])
        return [ProductVariation class];
    
    return nil;
}

@end
