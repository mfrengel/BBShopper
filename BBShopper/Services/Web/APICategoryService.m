//
//  APICategoryService.m
//  BBShopper
//
//  Created by MFrengel on 10/15/13.
//  Copyright (c) 2013 MFrengel. All rights reserved.
//

#import "APICategoryService.h"
#import "CategoryRepository.h"
#import "Category.h"

@interface APICategoryService()

@property (strong) CategoryRepository* categoryRepo;

@end


@implementation APICategoryService

-(void) loadCategories {
    // TODO: check internet connection, notify of failure if no connection & return
    
    AFAppDotNetAPIClient* client = [AFAppDotNetAPIClient sharedClient];
    [client getPath:@"categories"
         parameters:nil
            success:^(AFHTTPRequestOperation *operation, id responseObject) {
                NSArray* categories = [NSArray arrayWithArray:[responseObject valueForKeyPath:@"categories"]];
                
                @synchronized(self.categoryRepo) {
                    [self.categoryRepo removeAllItems];
                    [self.categoryRepo addItems: [self.serializer createArrayOfType: [Category class] fromArray:categories]];
                }
                
                if (self.delegate)
                    [self.delegate categoryLoadSuccess:self.categoryRepo.items];
            }
            failure:^(AFHTTPRequestOperation *operation, NSError* error) {
                if (self.delegate)
                    [self.delegate categoryLoadFailed: [error localizedDescription]];
            }];
}

@end
