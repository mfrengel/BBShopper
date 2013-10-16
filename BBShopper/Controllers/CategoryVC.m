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
}

@property (strong) APICategoryService* api;
@property (strong) CategoryRepository* repo;

@end

@implementation CategoryVC

#pragma mark - View lifecycle
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = NSLocalizedString(@"Categories", nil);
    
    self.api.delegate = self;
    [self.api loadCategories];
}


#pragma mark - TableView Datasource/Delegate methods
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.repo.items.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }

    Category* cat = [self.repo.items objectAtIndex:indexPath.row];
    
    if ([cat isKindOfClass:[Category class]])
        NSLog(@"itsa category");
    if ([cat isKindOfClass:[NSDictionary class]])
        NSLog(@"itsa dict");
    
    
    cell.textLabel.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:17];
    cell.textLabel.textColor = [UIColor darkTextColor];
    cell.textLabel.text = cat.title;

    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

#pragma mark - APICategoryServiceDelegate
-(void)categoryLoadSuccess:(NSArray *)categories {
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
-(void) refresh {
    [self.tableView reloadData];
}

@end
