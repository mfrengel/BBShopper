//
//  ProductListVC.m
//  BBShopper
//
//  Created by MFrengel on 10/16/13.
//  Copyright (c) 2013 MFrengel. All rights reserved.
//

#import "ProductListVC.h"
#import "APIProductService.h"
#import "UIImageView+AFNetworking.h"
#import "ProductDetailVC.h"

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
    static NSString *CellIdentifier = @"Cell2";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        
        cell.textLabel.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:15];
        //cell.textLabel.adjustsFontSizeToFitWidth = YES;
        cell.textLabel.textColor = [UIColor darkTextColor];
        
        cell.detailTextLabel.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:12];
        cell.detailTextLabel.textColor = [UIColor blueColor];
    }
    
    Product* prod = [_products objectAtIndex:indexPath.row];
    
    __weak typeof(UITableViewCell*) weakCell = cell;
    NSURL* url = [NSURL URLWithString:[prod.image.thumbs valueForKey:@"small"]];
    [cell.imageView setImageWithURLRequest:[NSURLRequest requestWithURL:url]
                          placeholderImage:[UIImage imageNamed:@"profile-image-placeholder.png"]
                                   success:^(NSURLRequest *request, NSHTTPURLResponse *response, UIImage *image) {
                                       weakCell.imageView.image = image;
                                       [weakCell layoutSubviews];
                                   }
                                   failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error) {
                                       return;
                                   }
     ];
    
    cell.textLabel.text = prod.title;
    
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    [formatter setNumberStyle:NSNumberFormatterCurrencyStyle];
    NSString* price = [prod.price valueForKey:@"value"];
    cell.detailTextLabel.text = [formatter stringFromNumber: [NSNumber numberWithDouble:[price doubleValue]]];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    ProductDetailVC* vc = [ProductDetailVC object];
    vc.product = [_products objectAtIndex:indexPath.row];
    [self.navigationController pushViewController:vc animated:YES];
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
