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

@interface ProductDetailVC()<APIProductServiceDelegate>

@property (strong) APIProductService* productAPI;
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
    NSLog(@"TODO: Add this item to cart");
    
    // TODO:
    // 1. Call add to cart API
    // 2. Response to delegate success/fail message
    // 3. Upon success, show the CartVC
    
    [self addToCartSuccess];
}

#pragma mark - APIProductServiceDelegate
-(void) getProductDetailSuccess:(ProductDetail*)productDetail {
    self.productDetail = productDetail;
    
    NSLog(@"%i variations", productDetail.variations.count);
    
    for (ProductVariation* v in productDetail.variations) {
        NSLog(@"\nMethod: %@, action: %@, id: %@", v.availability.online.forms.add_to_cart.method, v.availability.online.forms.add_to_cart.action, [v.availability.online.forms.add_to_cart.inputs objectForKey:@"id"]);
    }
}

-(void) getProductDetailFailed:(NSString *)error {
    [[[UIAlertView alloc] initWithTitle:@"Load Failed"
                                message:error
                               delegate:nil
                      cancelButtonTitle:@"Ok"
                      otherButtonTitles:nil] show];
}

#pragma mark - Cart delegate
-(void) addToCartSuccess {
    CartVC* vc = [CartVC object];
    [self.navigationController pushViewController:vc animated:YES];
    
}

@end
