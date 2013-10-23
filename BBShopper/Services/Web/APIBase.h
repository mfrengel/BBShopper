//
//  CategoryService.h
//  BBShopper
//
//  Created by MFrengel on 10/15/13.
//  Copyright (c) 2013 MFrengel. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BBAPIClient.h"
#import "JsonCerealizer.h"

@interface APIBase : NSObject

@property (strong) JsonCerealizer* serializer;

@end
