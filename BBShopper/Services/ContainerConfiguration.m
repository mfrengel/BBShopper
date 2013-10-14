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

@implementation ContainerConfiguration

-(void) configure {
    Container* container = [Container sharedContainer];
    [container addConvention: [IdiomContainerConvention convention]];

    [container registerClass:[JsonCerealizer class] forProtocol:@protocol(Cerealizable)];
    [container registerClass:[JsonCerealizer class]];
}

@end
