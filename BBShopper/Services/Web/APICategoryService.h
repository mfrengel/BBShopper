//
//  APICategoryService.h
//  BBShopper
//
//  Created by MFrengel on 10/15/13.
//  Copyright (c) 2013 MFrengel. All rights reserved.
//

#import "APIBase.h"

@protocol APICategoryServiceDelegate <NSObject>
@optional
-(void) categoryLoadSuccess:(NSArray*)categories;
-(void) categoryLoadFailed:(NSString*)error;
@end

@interface APICategoryService : APIBase

@property (weak) id<APICategoryServiceDelegate> delegate;

-(void) loadCategories;

@end
