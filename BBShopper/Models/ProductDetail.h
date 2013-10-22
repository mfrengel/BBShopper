//
//  ProductDetail.h
//  BBShopper
//
//  Created by MFrengel on 10/22/13.
//  Copyright (c) 2013 MFrengel. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Product.h"
#import "ProductVariation.h"

@interface ProductDetail : Product<Cerealizable>

@property (strong) NSArray* variations;

@end
