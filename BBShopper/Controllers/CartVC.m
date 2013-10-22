//
//  CartVC.m
//  BBShopper
//
//  Created by MFrengel on 10/21/13.
//  Copyright (c) 2013 MFrengel. All rights reserved.
//

#import "CartVC.h"

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
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"Cell3";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        
        cell.textLabel.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:15];
        cell.textLabel.textColor = [UIColor darkTextColor];
        
        cell.detailTextLabel.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:12];
        cell.detailTextLabel.textColor = [UIColor blueColor];
    }

    
    return cell;
}

-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

#pragma mark - Private Methods
-(void) checkout:(id)sender {
    NSLog(@"Proceed to checkout!");
}


@end
