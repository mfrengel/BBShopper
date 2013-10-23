//
//  APICartService.m
//  BBShopper
//
//  Created by MFrengel on 10/22/13.
//  Copyright (c) 2013 MFrengel. All rights reserved.
//

#import "APICartService.h"
#import "BBHTTPRequestOperation.h"

@implementation APICartService

-(void) addProductToCart:(Product*)product withVariation:(ProductVariation*)variation {
    // TODO: check internet connection, notify of failure if no connection & return
    
    NSMutableURLRequest* request = [NSMutableURLRequest requestWithURL: [NSURL URLWithString: variation.availability.online.forms.add_to_cart.action relativeToURL: [BBAPIClient sharedClient].baseURL]];
    [request setHTTPMethod:@"POST"];
    [request setValue: @"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
    NSString* formValue = [NSString stringWithFormat:@"id=%@&qty=1", [variation.availability.online.forms.add_to_cart.inputs objectForKey:@"id"]];
    [request setHTTPBody: [formValue dataUsingEncoding:NSUTF8StringEncoding]];
    
    BBHTTPRequestOperation *operation = [[BBHTTPRequestOperation alloc] initWithRequest:request];
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"Response: %@", [[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding]);
       
        if (self.delegate)
            [self.delegate addToCartSuccess];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
       NSLog(@"Error: %@", error);
        
        if (self.delegate)
            [self.delegate addToCartFailed: [error localizedDescription]];
    }];
    
    [operation start];
}

@end
