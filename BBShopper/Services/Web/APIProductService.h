//
//  APIProductService.h
//  BBShopper
//
//  Created by MFrengel on 10/16/13.
//  Copyright (c) 2013 MFrengel. All rights reserved.
//

#import "APIBase.h"
#import "Category.h"
#import "ProductDetail.h"

@protocol APIProductServiceDelegate <NSObject>
@optional
-(void) productLoadSuccess:(NSArray*)products;
-(void) productLoadFailed:(NSString*)error;

-(void) getProductDetailSuccess:(ProductDetail*)productDetail;
-(void) getProductDetailFailed:(NSString*)error;

@end

@interface APIProductService : APIBase

@property (weak) id<APIProductServiceDelegate> delegate;

-(void) loadProductsForCategory:(Category*)category;
-(void) getProductDetail:(Product*)product;

@end
