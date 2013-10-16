//
//  APIProductService.h
//  BBShopper
//
//  Created by MFrengel on 10/16/13.
//  Copyright (c) 2013 MFrengel. All rights reserved.
//

#import "APIBase.h"
#import "Category.h"
#import "Product.h"

@protocol APIProductServiceDelegate <NSObject>
@optional
-(void) productLoadSuccess:(NSArray*)products;
-(void) productLoadFailed:(NSString*)error;
@end

@interface APIProductService : APIBase

@property (weak) id<APIProductServiceDelegate> delegate;

-(void) loadProductsForCategory:(Category*)category;

@end
