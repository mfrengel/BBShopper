//
//  APICartService.h
//  BBShopper
//
//  Created by MFrengel on 10/22/13.
//  Copyright (c) 2013 MFrengel. All rights reserved.
//

#import "APIBase.h"
#import "ProductDetail.h"
#import "Cart.h"

@protocol APICartServiceDelegate <NSObject>
@optional
-(void) addToCartSuccess:(Cart*)cart;
-(void) addToCartFailed:(NSString*)error;
@end

@interface APICartService : APIBase

@property (weak) id<APICartServiceDelegate> delegate;

-(void) addProductToCart:(Product*)product withVariation:(ProductVariation*)variation;

@end
