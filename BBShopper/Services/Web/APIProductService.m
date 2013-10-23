//
//  APIProductService.m
//  BBShopper
//
//  Created by MFrengel on 10/16/13.
//  Copyright (c) 2013 MFrengel. All rights reserved.
//

#import "APIProductService.h"

@implementation APIProductService

-(void) loadProductsForCategory:(Category*)category {
    // TODO: check internet connection, notify of failure if no connection & return
    
    BBAPIClient* client = [BBAPIClient sharedClient];
    [client getPath:category.href
         parameters:nil
            success:^(AFHTTPRequestOperation *operation, id responseObject) {
                NSArray* data = [NSArray arrayWithArray:[responseObject valueForKeyPath:@"products"]];
                NSArray* products = [self.serializer createArrayOfType: [Product class] fromArray:data];
                
                if (self.delegate)
                    [self.delegate productLoadSuccess:products];
            }
            failure:^(AFHTTPRequestOperation *operation, NSError* error) {
                if (self.delegate)
                    [self.delegate productLoadFailed: [error localizedDescription]];
            }];
}

-(void) getProductDetail:(Product*)product {
    // TODO: check internet connection, notify of failure if no connection & return
    
    BBAPIClient* client = [BBAPIClient sharedClient];
    [client getPath:product.href
         parameters:nil
            success:^(AFHTTPRequestOperation *operation, id responseObject) {
                //NSLog(@"API RESPONSE: (getProductDetail): %@", responseObject);
                
                ProductDetail* prodDetail = [self.serializer create:[ProductDetail class] fromDictionary:responseObject];
                
                if (self.delegate)
                    [self.delegate getProductDetailSuccess:prodDetail];
            }
            failure:^(AFHTTPRequestOperation *operation, NSError* error) {
                if (self.delegate)
                    [self.delegate getProductDetailFailed: [error localizedDescription]];
            }];
}

@end
