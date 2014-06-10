//
//  MainCollectionViewController.m
//  InfiniteCollectionView
//
//  Created by Dayoung on 2014. 6. 10..
//  Copyright (c) 2014년 Dayoung Jung. All rights reserved.
//

#import "MainCollectionViewController.h"
#import "AccordionCell.h"

@interface MainCollectionViewController ()
@property (nonatomic, strong) NSArray *dataArray;
@end

@implementation MainCollectionViewController

static NSString *MainViewCellIdentifier = @"MainViewCellIdentifier";


- (void)viewDidLoad
{
    [super viewDidLoad];

    [self.collectionView setDelegate:self];
    [self.collectionView setDataSource:self];

    [self.navigationController.navigationBar setBackgroundImage:[UIImage new]
                                                  forBarMetrics:UIBarMetricsDefault];
    self.navigationController.navigationBar.shadowImage = [UIImage new];
    self.navigationController.navigationBar.translucent = YES;
}

- (void)viewWillAppear:(BOOL)animated {
    NSArray *originalArray = @[@"a", @"b", @"c", @"d", @"e"];
    id firstItem = originalArray[0];
    id lastItem = [originalArray lastObject];
    NSMutableArray *workingArray = [originalArray mutableCopy];
    [workingArray insertObject:lastItem atIndex:0];
    [workingArray addObject:firstItem];
    self.dataArray = [NSArray arrayWithArray:workingArray];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [self.dataArray count];
}

// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    AccordionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:MainViewCellIdentifier forIndexPath:indexPath];
    cell.titleLabel.text = (NSString *)[self.dataArray objectAtIndex:indexPath.row];
    return cell;
}



@end
