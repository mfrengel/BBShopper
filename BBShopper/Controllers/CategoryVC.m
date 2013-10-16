//
//  MasterViewController.m
//  BBShopper
//
//  Created by MFrengel on 10/13/13.
//  Copyright (c) 2013 MFrengel. All rights reserved.
//
#import "CategoryVC.h"
#import "APICategoryService.h"
#import "CategoryRepository.h"


@interface CategoryVC()<UITableViewDataSource,UITableViewDelegate,APICategoryServiceDelegate> {
    NSArray* _items;
}

@property (strong) APICategoryService* api;

@end

@implementation CategoryVC

#pragma mark - View lifecycle
- (void)viewDidLoad {
    [super viewDidLoad];
    
    if (self.mode == CategoryModeAll)
        self.title = NSLocalizedString(@"All Categories", nil);
    else
        self.title = NSLocalizedString(self.category.title, nil);
    
    self.api.delegate = self;
    [self load];
}

#pragma mark - TableView Datasource/Delegate methods
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _items.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }

    Category* cat = [_items objectAtIndex:indexPath.row];
    
    cell.textLabel.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:17];
    cell.textLabel.textColor = [UIColor darkTextColor];
    cell.textLabel.text = cat.title;

    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if (self.mode == CategoryModeAll) {
        CategoryVC* vc = [CategoryVC object];
        vc.mode = CategoryModeSub;
        vc.category = [_items objectAtIndex:indexPath.row];
        [self.navigationController pushViewController:vc animated:YES];
    }
}

#pragma mark - APICategoryServiceDelegate
-(void)categoryLoadSuccess:(NSArray *)categories {
    _items = categories;
    [self refresh];
}

-(void) categoryLoadFailed:(NSString *)error {
    [[[UIAlertView alloc] initWithTitle:@"Load Failed"
                                 message:error
                                delegate:nil
                       cancelButtonTitle:@"Ok"
                       otherButtonTitles:nil] show];
}

#pragma mark - Private
-(void) load {
    if (self.mode == CategoryModeAll)
        [self.api loadCategories];
    else if (self.mode == CategoryModeSub)
        [self.api loadSubCategories:self.category];
}

-(void) refresh {
    [self.tableView reloadData];
}

@end
