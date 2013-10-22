//
//  ProductAvailabilityOnline.h
//  BBShopper
//
//  Created by MFrengel on 10/22/13.
//  Copyright (c) 2013 MFrengel. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cerealizable.h"
#import "ProductAvailabilityForms.h"

@interface ProductAvailabilityOnline : NSObject<Cerealizable>

@property (strong) NSString* id;
@property (strong) NSString* value;
@property (strong) NSString* fulfillment;
@property (strong) ProductAvailabilityForms* forms;

@end
