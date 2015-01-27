//
//  MovieCell.h
//  rottenTomato
//
//  Created by James (Xinghai) on 1/26/15.
//  Copyright (c) 2015 Xinghai. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MovieCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *synopsisLabel;
@property (weak, nonatomic) IBOutlet UIImageView *posterView;

@end
