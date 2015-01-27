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
    cell.textLabel.text = self.movie[@"synopsis"];
    NSURL *imageURL = [NSURL URLWithString:[self.movie valueForKeyPath:@"posters.detailed"]];
    NSData *imageData = [NSData dataWithContentsOfURL:imageURL];
    UIImage *image = [UIImage imageWithData:imageData];
    cell.backgroundColor = [[UIColor alloc] initWithPatternImage:image];
    return cell;
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
