//
//  Lista_Controller.m
//  NearBuy_ios
//
//  Created by bruno on 22/11/14.
//  Copyright (c) 2014 bruno. All rights reserved.
//

#import "Lista_Controller.h"
#import "INSSearchBar.h"

@interface Lista_Controller ()<INSSearchBarDelegate>
@property (nonatomic, strong) INSSearchBar *searchBarWithDelegate;
@end

@implementation Lista_Controller

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIImage *img =[UIImage imageNamed:@"box.png"];
    
    UIImageView *imgvheader =[[UIImageView alloc] initWithImage:img];
    imgvheader.frame =CGRectMake(0, 10, 320, 100);
    
    self.view.backgroundColor =[UIColor blackColor];

    UILabel *descriptionLabel2 = [[UILabel alloc] initWithFrame:CGRectMake(20.0, 40, CGRectGetWidth(self.view.bounds) - 40.0, 20.0)];
    descriptionLabel2.textColor = [UIColor whiteColor];
    descriptionLabel2.font = [UIFont fontWithName:@"AvenirNext-Regular" size:16.0];
    descriptionLabel2.text = @"Ingrese Producto :";
    
    [self.view addSubview:descriptionLabel2];
    
    self.searchBarWithDelegate = [[INSSearchBar alloc] initWithFrame:CGRectMake(20.0, 70, 44.0, 34.0)];
    self.searchBarWithDelegate.delegate = self;
    
    [self.view addSubview:self.searchBarWithDelegate];
    [self.view addSubview:imgvheader];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - search bar delegate

- (CGRect)destinationFrameForSearchBar:(INSSearchBar *)searchBar
{
    return CGRectMake(5, 80, CGRectGetWidth(self.view.bounds) - 10.0, 34.0);
}

- (void)searchBar:(INSSearchBar *)searchBar willStartTransitioningToState:(INSSearchBarState)destinationState
{
    // Do whatever you deem necessary.
}

- (void)searchBar:(INSSearchBar *)searchBar didEndTransitioningFromState:(INSSearchBarState)previousState
{
    // Do whatever you deem necessary.
}

- (void)searchBarDidTapReturn:(INSSearchBar *)searchBar
{
    // Do whatever you deem necessary.
    // Access the text from the search bar like searchBar.searchField.text
}

- (void)searchBarTextDidChange:(INSSearchBar *)searchBar
{
    // Do whatever you deem necessary.
    // Access the text from the search bar like searchBar.searchField.text
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
