//
//  CategoryRepository.h
//  BBShopper
//
//  Created by MFrengel on 10/15/13.
//  Copyright (c) 2013 MFrengel. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Category.h"

@interface CategoryRepository : NSObject

@property (readonly) NSMutableArray* items;

-(void) removeAllItems;
-(void) addItems:(NSArray*)items;

@end
