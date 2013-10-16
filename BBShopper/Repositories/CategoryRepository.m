//
//  CategoryRepository.m
//  BBShopper
//
//  Created by MFrengel on 10/15/13.
//  Copyright (c) 2013 MFrengel. All rights reserved.
//

#import "CategoryRepository.h"

@interface CategoryRepository() {
    NSMutableArray* data;
}

@end

@implementation CategoryRepository

-(NSArray*) items {
    return data;
}

-(id) init {
    if ((self = [super init])) {
        data = [[NSMutableArray alloc] init];
    }

    return self;
}

-(void) removeAllItems {
    [data removeAllObjects];
}

-(void) addItems:(NSArray*)items {
    [data addObjectsFromArray: items];
}


@end
