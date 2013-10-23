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
#import "APIProductService.h"
#import "APICartService.h"

@interface ProductDetailVC()<APIProductServiceDelegate,APICartServiceDelegate>

@property (strong) APIProductService* productAPI;
@property (strong) APICartService* cartAPI;

@property (strong) ProductDetail* productDetail;

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
        self.prodPromo.text = @"There are no promotions at this time.";
    
    self.productAPI.delegate = self;
    [self.productAPI getProductDetail:self.product];
}


- (IBAction)addToCart:(id)sender {    
    self.cartAPI.delegate = self;
    [self.cartAPI addProductToCart:self.product withVariation: [self.productDetail.variations objectAtIndex:0]];
}

#pragma mark - APIProductServiceDelegate
-(void) getProductDetailSuccess:(ProductDetail*)productDetail {
    self.productDetail = productDetail;
}

-(void) getProductDetailFailed:(NSString *)error {
    [[[UIAlertView alloc] initWithTitle:@"Load Failed"
                                message:error
                               delegate:nil
                      cancelButtonTitle:@"Ok"
                      otherButtonTitles:nil] show];
}

#pragma mark - APICartServiceDelegate
-(void)addToCartSuccess:(Cart *)cart {
    CartVC* vc = [CartVC object];
    [self.navigationController pushViewController:vc animated:YES];
}

-(void)addToCartFailed:(NSString *)error {
    [[[UIAlertView alloc] initWithTitle:@"Add to Cart Failed"
                                message:error
                               delegate:nil
                      cancelButtonTitle:@"Ok"
                      otherButtonTitles:nil] show];
}

@end
