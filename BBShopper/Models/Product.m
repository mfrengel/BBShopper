//
//  Product.m
//  BBShopper
//
//  Created by MFrengel on 10/16/13.
//  Copyright (c) 2013 MFrengel. All rights reserved.
//

#import "Product.h"


@implementation Product

-(Class)classTypeForKey:(NSString *)key {
    if ([key isEqualToString:SELF_KEYPATH(promos)])
        return [ProductPromo class];
    return nil;
}

@end
