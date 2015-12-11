//
//  ViewController.m
//  KMSearchDisplayControllerDemo
//
//  Created by Klein Mioke on 15/12/11.
//  Copyright © 2015年 KleinMioke. All rights reserved.
//

#import "ViewController.h"
#import "KMSearchDisplayController.h"

@interface ViewController () <UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate, KMSearchDisplayControllerDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (strong, nonatomic) UISearchBar *searchBar;
@property (strong, nonatomic) KMSearchDisplayController *displayController;

@property (strong, nonatomic) UIImage *demoImage;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
    
    self.searchBar = ({
        UISearchBar *bar = [[UISearchBar alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.height, 44)];
        bar.delegate = self;
        bar.tintColor = [UIColor whiteColor];
        
        bar;
    });
    
    self.displayController = ({
        KMSearchDisplayController *ctrl = [[KMSearchDisplayController alloc] initWithSearchBar:self.searchBar contentsController:self];
        ctrl.delegate = self;
        ctrl.searchResultDelegate = self;
        ctrl.searchResultDataSource = self;
        
        // You can costomize with the following properties
        ctrl.searchResultTableView.tag = 2;
        
        UILabel *search = [[UILabel alloc] initWithFrame:CGRectMake(0, 100, [UIScreen mainScreen].bounds.size.width, 40)];
        search.textAlignment = NSTextAlignmentCenter;
        search.textColor = [UIColor whiteColor];
        search.font = [UIFont systemFontOfSize:18];
        
        search.text = @"Search for fun~";
        [ctrl.backgroundContentView addSubview:search];
        
        ctrl;
    });
    
    self.tableView.tableHeaderView = self.searchBar;
    
    self.demoImage = [UIImage imageNamed:@"image"];
    
    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - UISearchBar's delegate

- (BOOL)searchBarShouldBeginEditing:(UISearchBar *)searchBar {
    
    [self.displayController showSearchResultView];
    return YES;
}

- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar {
    
    [self.displayController hideSearchResultView];
}

#pragma mark - UITableView's delegate and datasource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

#pragma mark Cell
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (self.demoImage && self.demoImage.size.width) {
        return [UIScreen mainScreen].bounds.size.width * self.demoImage.size.height / self.demoImage.size.width;
    }
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.width * self.demoImage.size.height / self.demoImage.size.width)];
    imageView.image = self.demoImage;
    imageView.contentMode = UIViewContentModeScaleAspectFill;
    
    [cell addSubview:imageView];
    
    return cell;
}

#pragma mark Actions
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}

@end
