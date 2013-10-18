//
//  ProductDetailVC.h
//  BBShopper
//
//  Created by MFrengel on 10/17/13.
//  Copyright (c) 2013 MFrengel. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ProductDetailVC : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *prodDescription;
@property (weak, nonatomic) IBOutlet UIImageView *prodImage;
@property (weak, nonatomic) IBOutlet UILabel *prodPrice;
@property (weak, nonatomic) IBOutlet UILabel *prodPromo;

- (IBAction)addToCart:(id)sender;

@end
