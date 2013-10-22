//
//  ProductAvailabilityForm.h
//  BBShopper
//
//  Created by MFrengel on 10/22/13.
//  Copyright (c) 2013 MFrengel. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cerealizable.h"

@interface ProductAvailabilityForm : NSObject<Cerealizable>

@property (strong) NSString* method;
@property (strong) NSString* action;
@property (strong) NSDictionary* inputs;

@end
