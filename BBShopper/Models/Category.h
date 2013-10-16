//
//  Category.h
//  BBShopper
//
//  Created by MFrengel on 10/15/13.
//  Copyright (c) 2013 MFrengel. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cerealizable.h"

@interface Category : NSObject<Cerealizable>

@property (strong) NSString* id;
@property (strong) NSString* href;
@property (strong) NSString* title;

@end
