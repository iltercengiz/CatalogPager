//
//  CatalogPageViewController.m
//  CatalogPager
//
//  Created by Ilter Cengiz on 25/08/14.
//  Copyright (c) 2014 Ilter Cengiz. All rights reserved.
//

#import "CatalogPageViewController.h"

@interface CatalogPageViewController ()

@end

@implementation CatalogPageViewController

#pragma mark - View life cycle

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
}

#pragma mark - Collection view data source 

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.catalogItems.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"CatalogItemCell" forIndexPath:indexPath];
    
    UILabel *label = (UILabel *)[cell viewWithTag:1];
    label.text = self.catalogItems[indexPath.row];
    
    return cell;
    
}

#pragma mark - Collection view delegate

@end
