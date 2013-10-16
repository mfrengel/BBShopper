//
//  MasterViewController.h
//  BBShopper
//
//  Created by MFrengel on 10/13/13.
//  Copyright (c) 2013 MFrengel. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Category.h"

typedef enum {
    CategoryModeAll,
    CategoryModeSub
} CategoryMode;

@interface CategoryVC : UIViewController

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property CategoryMode mode;
@property (strong) Category* category;

@end
