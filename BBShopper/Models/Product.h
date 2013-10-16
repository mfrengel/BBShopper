//
//  Product.h
//  BBShopper
//
//  Created by MFrengel on 10/16/13.
//  Copyright (c) 2013 MFrengel. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cerealizable.h"
#import "ProductPromo.h"
#import "ProductImage.h"

@interface Product : NSObject<Cerealizable>

@property (strong) NSString* title;
@property (strong) NSString* id;
@property (strong) NSDictionary* price;
@property (strong) NSArray* promos;
@property (strong) ProductImage* image;
@property (strong) NSString* href;

@end
