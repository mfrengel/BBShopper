//
//  MasterViewController.m
//  BBShopper
//
//  Created by MFrengel on 10/13/13.
//  Copyright (c) 2013 MFrengel. All rights reserved.
//
#import "CategoryVC.h"

@interface CategoryVC()<UITableViewDataSource,UITableViewDelegate> {
}

@end

@implementation CategoryVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"Categories";
}


#pragma mark - TableView Datasource/Delegate methods
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }


    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
