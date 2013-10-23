//
//  Cart.m
//  BBShopper
//
//  Created by MFrengel on 10/23/13.
//  Copyright (c) 2013 MFrengel. All rights reserved.
//

#import "Cart.h"

@implementation Cart

-(Class)classTypeForKey:(NSString *)key {
    if ([key isEqualToString:SELF_KEYPATH(products)])
        return [CartProduct class];
    return nil;
}

@end
