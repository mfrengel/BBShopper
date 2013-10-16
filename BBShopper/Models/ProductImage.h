//
//  ProductImages.h
//  BBShopper
//
//  Created by MFrengel on 10/16/13.
//  Copyright (c) 2013 MFrengel. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cerealizable.h"

@interface ProductImage : NSObject<Cerealizable>

@property (strong) NSString* full;
@property (strong) NSDictionary* thumbs;


@end
