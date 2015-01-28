//
//  MovieDetailViewController.m
//  rottenTomato
//
//  Created by James (Xinghai) on 1/26/15.
//  Copyright (c) 2015 Xinghai. All rights reserved.
//

#import "MovieDetailViewController.h"

@interface MovieDetailViewController () <UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *movieDetailTableView;

@end

@implementation MovieDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = self.movie[@"title"];
    
    NSURL *imageURL = [NSURL URLWithString:[self.movie valueForKeyPath:@"posters.original"]];
    NSData *imageData = [NSData dataWithContentsOfURL:imageURL];
    UIImage *image = [UIImage imageWithData:imageData];
    UIImageView *tmpImageView = [[UIImageView alloc] initWithImage:image];
    [tmpImageView setFrame:self.movieDetailTableView.frame];
    self.movieDetailTableView.backgroundView = tmpImageView;
    
    self.movieDetailTableView.dataSource = self;
    self.movieDetailTableView.delegate = self;
    self.movieDetailTableView.rowHeight = 600;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell* cell = [[UITableViewCell alloc] init];
    cell.backgroundColor = [UIColor colorWithRed:.8 green:.8 blue:.8 alpha: 0.7];
    cell.textLabel.text = self.movie[@"synopsis"];
    cell.textLabel.textAlignment =NSTextAlignmentLeft;
    cell.textLabel.numberOfLines = 0;
    [cell.textLabel setFont:[UIFont fontWithName:@"System" size:25]];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self.movieDetailTableView deselectRowAtIndexPath:indexPath animated:YES];
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
