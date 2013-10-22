//
//  ProductDetailVC.m
//  BBShopper
//
//  Created by MFrengel on 10/17/13.
//  Copyright (c) 2013 MFrengel. All rights reserved.
//

#import "ProductDetailVC.h"
#import "UIImageView+AFNetworking.h"
#import "CartVC.h"

@interface ProductDetailVC ()

@end

@implementation ProductDetailVC


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"Product Detail";
    
    self.prodDescription.text = self.product.title;
    [self.prodImage setImageWithURL: [NSURL URLWithString:self.product.image.full]];
    
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    [formatter setNumberStyle:NSNumberFormatterCurrencyStyle];
    NSString* price = [self.product.price valueForKey:@"value"];
    self.prodPrice.text = [formatter stringFromNumber: [NSNumber numberWithDouble:[price doubleValue]]];
    
    NSLog(@"href: %@", self.product.href);
    
    // Just show the 1st promo
    if (self.product.promos.count > 0) {
        self.prodPromo.text = ((ProductPromo*)[self.product.promos objectAtIndex:0]).description;
    }
    else
        self.prodPromo.text = @"There are no promotions at this time, bummer dude.";
}


- (IBAction)addToCart:(id)sender {
    NSLog(@"TODO: Add this item to cart");
    
    // TODO:
    // 1. Call add to cart API
    // 2. Response to delegate success/fail message
    // 3. Upon success, show the CartVC
    
    [self AddToCartSuccess];
}

#pragma mark - Cart delegate
-(void) AddToCartSuccess {
    CartVC* vc = [CartVC object];
    [self.navigationController pushViewController:vc animated:YES];
    
}

@end
