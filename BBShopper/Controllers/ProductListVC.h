//
//  ProductListVC.h
//  BBShopper
//
//  Created by MFrengel on 10/16/13.
//  Copyright (c) 2013 MFrengel. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Category.h"

@interface ProductListVC : UIViewController

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (strong) Category* category;

@end
