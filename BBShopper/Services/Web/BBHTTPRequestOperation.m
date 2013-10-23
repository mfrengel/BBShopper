//
//  BBHTTPRequestOperation.m
//  BBShopper
//
//  Created by MFrengel on 10/23/13.
//  Copyright (c) 2013 MFrengel. All rights reserved.
//

#import "BBHTTPRequestOperation.h"

@implementation BBHTTPRequestOperation

-(NSURLRequest *)connection:(NSURLConnection *)connection willSendRequest:(NSURLRequest *)request redirectResponse:(NSURLResponse *)response {
    if (response) {
        NSMutableURLRequest *r = [request mutableCopy];
        [r setURL: [request URL]];
        return r;
    }
    else {
        return request;
    }
}

@end
