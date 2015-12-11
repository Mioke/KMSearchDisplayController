# KMSearchDisplayController
Editable backView when searching, blur and transparent background. Beeeeeeautiful!

### Demo
![gif](https://github.com/Mioke/KMSearchDisplayController/blob/master/KMSearchDisplayControllerDemo/KMSearchDisplayControllerDemo/KMSearchDisplayControllerDemo2.gif)

### Usage
> 1. Download zip and copy the `KMSearchDisplayController` folder into your project;
> 2. `#import "KMSearchDisplayController.h"' where your want to use;
> 3. Initialize the controller like this:

>  ```objc
>  self.displayController = ({
>      KMSearchDisplayController *ctrl = [[KMSearchDisplayController alloc] initWithSearchBar:self.searchBar contentsController:self];
>      ctrl.delegate = self;
>      ctrl.searchResultDelegate = self;
>      ctrl.searchResultDataSource = self;
>      ctrl;
>  });
>  ```
> 4. Show and hide the displayController's view whenever you want to.

>```objc
>#pragma mark - UISearchBar's delegate
>
>- (BOOL)searchBarShouldBeginEditing:(UISearchBar *)searchBar {
>    
>    [self.displayController showSearchResultView];
>    return YES;
>}
>
>- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar {
>    
>    [self.displayController hideSearchResultView];
>}
>```
> 5. Costomize your own way using `KMSearchDisplayController.searchResultTableView` and `KMSearchDisplayController.backgroundContentView`.

### Other
  More infomation to see in demo, any good idea or bug you can open an issue.
  
# LICENCE
  All the source code is published under the MIT Licence. See the LICENCE file for details.
