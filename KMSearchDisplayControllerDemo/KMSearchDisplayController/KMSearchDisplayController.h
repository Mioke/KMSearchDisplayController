//
//  KMSearchDisplayController.h
//  XKRW
//
//  Created by Klein Mioke on 15/6/25.
//  Copyright (c) 2015年 XiKang. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol KMSearchDisplayControllerDelegate <NSObject>

@optional

@end

@interface KMSearchDisplayController : NSObject

@property (nonatomic, strong) NSString *identifier;

@property (nonatomic, weak) id <UITableViewDataSource> searchResultDataSource;
@property (nonatomic, weak) id <UITableViewDelegate> searchResultDelegate;

@property (nonatomic, weak) id <KMSearchDisplayControllerDelegate> delegate;

@property (nonatomic, strong) UITableView *searchResultTableView;

@property (nonatomic) BOOL isShowSearchResultTableView;

@property (nonatomic, strong) UIView *backgroundContentView;

- (instancetype)initWithSearchBar:(UISearchBar *)searchBar contentsController:(UIViewController *)viewController;

- (void)showSearchResultView;
- (void)hideSearchResultView;

- (void)reloadSearchResultTableView;
- (void)showSearchResultTableView;
- (void)hideSearchResultTableView;

@end
