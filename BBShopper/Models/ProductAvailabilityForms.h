//
//  OnlineForms.h
//  BBShopper
//
//  Created by MFrengel on 10/22/13.
//  Copyright (c) 2013 MFrengel. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cerealizable.h"
#import "ProductAvailabilityForm.h"

@interface ProductAvailabilityForms : NSObject<Cerealizable>

@property (strong) ProductAvailabilityForm* add_to_cart;
@property (strong) ProductAvailabilityForm* add_to_wishlist;

@end
