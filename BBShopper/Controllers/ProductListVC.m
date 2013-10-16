//
//  ProductListVC.m
//  BBShopper
//
//  Created by MFrengel on 10/16/13.
//  Copyright (c) 2013 MFrengel. All rights reserved.
//

#import "ProductListVC.h"
#import "APIProductService.h"

@interface ProductListVC ()<UITableViewDataSource,UITableViewDelegate,APIProductServiceDelegate> {
    NSArray* _products;
}

@property (strong) APIProductService* api;

@end

@implementation ProductListVC

#pragma mark - View lifecycle
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = NSLocalizedString(self.category.title, nil);

    self.api.delegate = self;
    [self.api loadProductsForCategory:self.category];
}
#pragma mark - TableView Datasource/Delegate methods
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _products.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    
    Product* prod = [_products objectAtIndex:indexPath.row];
    
    // TODO: show price & image
    
    cell.textLabel.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:12];
    cell.textLabel.adjustsFontSizeToFitWidth = YES;
    cell.textLabel.textColor = [UIColor darkTextColor];
    cell.textLabel.text = prod.title;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

#pragma mark - APIProductServiceDelegate
-(void)productLoadSuccess:(NSArray *)products {
    _products = products;
    [self refresh];
}

-(void) productLoadFailed:(NSString *)error {
    [[[UIAlertView alloc] initWithTitle:@"Load Failed"
                                message:error
                               delegate:nil
                      cancelButtonTitle:@"Ok"
                      otherButtonTitles:nil] show];
}

#pragma mark - Private
-(void) refresh {
    [self.tableView reloadData];
}

@end
