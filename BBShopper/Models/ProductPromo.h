//
//  ProductPromo.h
//  BBShopper
//
//  Created by MFrengel on 10/16/13.
//  Copyright (c) 2013 MFrengel. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cerealizable.h"

@interface ProductPromo : NSObject<Cerealizable>

@property (strong) NSString* description;
@property (strong) NSString* href;

@end
