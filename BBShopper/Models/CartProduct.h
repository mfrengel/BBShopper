//
//  CartProduct.h
//  BBShopper
//
//  Created by MFrengel on 10/23/13.
//  Copyright (c) 2013 MFrengel. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cerealizable.h"

@interface CartProduct : NSObject<Cerealizable>

@property (strong) NSString* title;
@property (strong) NSString* image;
@property (strong) NSNumber* quantity;
@property (strong) NSDictionary* price;

@end
