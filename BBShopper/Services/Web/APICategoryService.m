//
//  APICategoryService.m
//  BBShopper
//
//  Created by MFrengel on 10/15/13.
//  Copyright (c) 2013 MFrengel. All rights reserved.
//

#import "APICategoryService.h"
#import "CategoryRepository.h"


@interface APICategoryService()

@property (strong) CategoryRepository* categoryRepo;

@end


@implementation APICategoryService

-(void) loadCategories {
    // TODO: check internet connection, notify of failure if no connection & return
    
    BBAPIClient* client = [BBAPIClient sharedClient];
    [client getPath:@"categories"
         parameters:nil
            success:^(AFHTTPRequestOperation *operation, id responseObject) {
                NSArray* data = [NSArray arrayWithArray:[responseObject valueForKeyPath:@"categories"]];
                
                @synchronized(self.categoryRepo) {
                    [self.categoryRepo removeAllItems];
                    [self.categoryRepo addItems: [self.serializer createArrayOfType: [Category class] fromArray:data]];
                }
                
                if (self.delegate)
                    [self.delegate categoryLoadSuccess:self.categoryRepo.items];
            }
            failure:^(AFHTTPRequestOperation *operation, NSError* error) {
                if (self.delegate)
                    [self.delegate categoryLoadFailed: [error localizedDescription]];
            }];
}

-(void) loadSubCategories:(Category*)category {
    // TODO: check internet connection, notify of failure if no connection & return
    
    BBAPIClient* client = [BBAPIClient sharedClient];
    [client getPath:category.href
         parameters:nil
            success:^(AFHTTPRequestOperation *operation, id responseObject) {
                NSArray* data = [NSArray arrayWithArray:[responseObject valueForKeyPath:@"categories"]];
                NSArray* subs = [self.serializer createArrayOfType: [Category class] fromArray:data];
                
                if (self.delegate)
                    [self.delegate categoryLoadSuccess:subs];
            }
            failure:^(AFHTTPRequestOperation *operation, NSError* error) {
                if (self.delegate)
                    [self.delegate categoryLoadFailed: [error localizedDescription]];
            }];
}

@end
