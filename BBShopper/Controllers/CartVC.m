//
//  CartVC.m
//  BBShopper
//
//  Created by MFrengel on 10/21/13.
//  Copyright (c) 2013 MFrengel. All rights reserved.
//

#import "CartVC.h"
#import "UIImageView+AFNetworking.h"

@interface CartVC ()<UITableViewDataSource,UITableViewDelegate>

@end

@implementation CartVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = NSLocalizedString(@"Cart", nil);
    
    // Do any additional setup after loading the view from its nib.
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Checkout"
                                                                              style:UIBarButtonItemStylePlain
                                                                             target:self
                                                                             action:@selector(checkout:)];
}

#pragma mark - TableView Datasource/Delegate methods
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.cart.products.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"Cell3";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
        cell.accessoryType = UITableViewCellAccessoryNone;
        
        cell.textLabel.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:15];
        cell.textLabel.textColor = [UIColor darkTextColor];
        
        cell.detailTextLabel.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:12];
        cell.detailTextLabel.textColor = [UIColor blueColor];
    }
    
    CartProduct* prod = [self.cart.products objectAtIndex:indexPath.row];
    
    __weak typeof(UITableViewCell*) weakCell = cell;
    NSURL* url = [NSURL URLWithString:prod.image];
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
    

    NSString* price = [prod.price valueForKey:@"per_item"];
    price = [[self formatter] stringFromNumber: [NSNumber numberWithDouble:[price doubleValue]]];
    
    NSString* total = [prod.price valueForKey:@"for_all"];
    total = [[self formatter] stringFromNumber: [NSNumber numberWithDouble:[total doubleValue]]];
    
    cell.detailTextLabel.text = [NSString stringWithFormat:@"Qty %i, %@, Total: %@", [prod.quantity intValue], price, total];
    
    return cell;
}

-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

#pragma mark - Private Methods
-(void) checkout:(id)sender {
    [[[UIAlertView alloc] initWithTitle:NSLocalizedString(@"Thank You", nil)
                                message:NSLocalizedString(@"Thanks for your order.\nFrom here we could proceed to checkout.\nThat's all for now.", nil)
                               delegate:nil
                      cancelButtonTitle:@"Ok"
                      otherButtonTitles:nil] show];
}

-(NSNumberFormatter*) formatter {
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    [formatter setNumberStyle:NSNumberFormatterCurrencyStyle];
    return formatter;
}

@end
