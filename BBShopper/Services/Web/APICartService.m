//
//  APICartService.m
//  BBShopper
//
//  Created by MFrengel on 10/22/13.
//  Copyright (c) 2013 MFrengel. All rights reserved.
//

#import "APICartService.h"
#import "AFHTTPRequestOperation.h"

@implementation APICartService

-(void) addProductToCart:(Product*)product withVariation:(ProductVariation*)variation {
    // TODO: check internet connection, notify of failure if no connection & return
    
    AFAppDotNetAPIClient* client = [AFAppDotNetAPIClient sharedClient];
    [client setParameterEncoding:AFFormURLParameterEncoding];

    NSString* formValue = [NSString stringWithFormat:@"%@&qty=1", [variation.availability.online.forms.add_to_cart.inputs objectForKey:@"id"]];
    formValue = [formValue stringByAddingPercentEscapesUsingEncoding: NSUTF8StringEncoding];
    
    NSMutableURLRequest* request = [NSMutableURLRequest requestWithURL: [NSURL URLWithString: variation.availability.online.forms.add_to_cart.action relativeToURL: client.baseURL]];
    [request setHTTPMethod:@"POST"];
    [request setValue: @"application/x-www-form-urlencoded" forHTTPHeaderField:@"content-type"];
    [request setValue: @"0" forHTTPHeaderField:@"content-length"];

    [request setValue: formValue forHTTPHeaderField:@"form"];
    
    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    [operation setRedirectResponseBlock:^NSURLRequest *(NSURLConnection *connection, NSURLRequest *request, NSURLResponse *redirectResponse) {
        NSLog(@"Redirect");
        
        if (redirectResponse) {
            NSMutableURLRequest *r = [request mutableCopy]; // original request
            [r setURL: [request URL]];
            return r;
        }
        else {
            return request;
        }
    }];
    
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
