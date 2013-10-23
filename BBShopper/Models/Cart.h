//
//  Cart.h
//  BBShopper
//
//  Created by MFrengel on 10/23/13.
//  Copyright (c) 2013 MFrengel. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cerealizable.h"
#import "CartProduct.h"

@interface Cart : NSObject<Cerealizable>

@property (strong) NSDictionary* summary;
@property (strong) NSArray* products;

@end
