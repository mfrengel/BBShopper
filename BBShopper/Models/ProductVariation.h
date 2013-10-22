//
//  ProductVariation.h
//  BBShopper
//
//  Created by MFrengel on 10/22/13.
//  Copyright (c) 2013 MFrengel. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cerealizable.h"
#import "ProductAvailability.h"

@interface ProductVariation : NSObject

@property (strong) ProductAvailability* availability;

@end
