//
//  ContainerConfiguration.m
//  BBShopper
//
//  Created by MFrengel on 10/14/13.
//  Copyright (c) 2013 MFrengel. All rights reserved.
//

#import "ContainerConfiguration.h"
#import "Container.h"
#import "IdiomContainerConvention.h"

#import "JsonCerealizer.h"
#import "AFAppDotNetAPIClient.h"
#import "APICategoryService.h"

#import "CategoryRepository.h"

#import "CategoryVC.h"

@implementation ContainerConfiguration

-(void) configure {
    Container* container = [Container sharedContainer];
    
    [container addConvention: [IdiomContainerConvention convention]];

    // Services
    [container registerClass:[JsonCerealizer class] forProtocol:@protocol(Cerealizable)];
    [container registerClass:[JsonCerealizer class]];
    
    [container registerClass:[AFAppDotNetAPIClient class]];
    [container registerClass:[APICategoryService class]];
    
    // Repositories
    [container registerClass:[CategoryRepository class] cache:YES];
    
    // View controllers
    [container registerClass:[CategoryVC class]];
}

@end
