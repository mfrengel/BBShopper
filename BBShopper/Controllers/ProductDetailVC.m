//
//  ProductDetailVC.m
//  BBShopper
//
//  Created by MFrengel on 10/17/13.
//  Copyright (c) 2013 MFrengel. All rights reserved.
//

#import "ProductDetailVC.h"
#import "UIImageView+AFNetworking.h"

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
    
    // Just show the 1st promo
    if (self.product.promos.count > 0) {
        self.prodPromo.text = ((ProductPromo*)[self.product.promos objectAtIndex:0]).description;
    }
    else
        self.prodPromo.text = @"There are no promotions at this time, bummer dude.";
}


- (IBAction)addToCart:(id)sender {
    NSLog(@"TODO: Add this item to cart");
}
@end
