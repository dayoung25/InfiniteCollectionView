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
@property (nonatomic, strong) NSMutableArray *dataArray;
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

    [self setupDataForCollectionView];
    

}

- (void)viewDidAppear:(BOOL)animated {
    NSIndexPath *newIndexPath = [NSIndexPath indexPathForItem:4 inSection:0];
    
    [self.collectionView scrollToItemAtIndexPath:newIndexPath atScrollPosition:UICollectionViewScrollPositionTop animated:NO];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

-(void)setupDataForCollectionView {
    
    // Create the original set of data
    NSArray *originalArray = @[@"a", @"b", @"c", @"d", @"e"];
    
    // Grab references to the first and last items
    // They're typed as id so you don't need to worry about what kind
    // of objects the originalArray is holding
//    id firstItem = originalArray[0];
//    id lastItem = [originalArray lastObject];
//    
//    NSMutableArray *workingArray = [originalArray mutableCopy];
//    
//    // Add the copy of the last item to the beginning
//    [workingArray insertObject:lastItem atIndex:0];
//    
//    // Add the copy of the first item to the end
//    [workingArray addObject:firstItem];
    
    // Update the collection view's data source property
    self.dataArray = [[NSMutableArray alloc] initWithArray:[originalArray copy]];
//    self.dataArray = [[[NSMutableArray alloc] initWithArray:[originalArray mutableCopy]];
    
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [self.dataArray count]*3;
}

// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    AccordionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:MainViewCellIdentifier forIndexPath:indexPath];
    
    cell.titleLabel.text = (NSString *)[self.dataArray objectAtIndex:(indexPath.row%([self.dataArray count]))];
    return cell;
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    
//    NSLog(@"ddd %f", scrollView.contentOffset.y);
//    if (scrollView.contentOffset.y > 85.0f) {
//        
//        // user is scrolling to the right from the last item to the 'fake' item 1.
//        // reposition offset to show the 'real' item 1 at the left-hand end of the collection view
//        
//        NSIndexPath *newIndexPath = [NSIndexPath indexPathForItem:0 inSection:0];
//        
//        [self.collectionView scrollToItemAtIndexPath:newIndexPath atScrollPosition:UICollectionViewScrollPositionTop animated:NO];
//        
//    } else if (scrollView.contentOffset.y < 20.0f)  {
//        
//        // user is scrolling to the left from the first item to the fake 'item N'.
//        // reposition offset to show the 'real' item N at the right end end of the collection view
//        
//        NSIndexPath *newIndexPath = [NSIndexPath indexPathForItem:([self.dataArray count] -1) inSection:0];
//        
//        [self.collectionView scrollToItemAtIndexPath:newIndexPath atScrollPosition:UICollectionViewScrollPositionTop animated:NO];
//        
//    }

}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    
    // Calculate where the collection view should be at the right-hand end item
//    float contentOffsetWhenFullyScrolledDown = self.collectionView.frame.size.height * ([self.dataArray count] -1);
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    NSLog(@"ddd %f", scrollView.contentOffset.y);
    
    if (scrollView.contentOffset.y < 400.0f) {

    }
//    if (scrollView.contentOffset.y > 200.0f) {
//        
//        [self.dataArray ]
//        NSIndexPath *newIndexPath = [NSIndexPath indexPathForItem:2 inSection:0];
//        
//        [self.collectionView scrollToItemAtIndexPath:newIndexPath atScrollPosition:UICollectionViewScrollPositionTop animated:NO];
//    } else if (scrollView.contentOffset.y < 100.0f) {
//        NSIndexPath *newIndexPath = [NSIndexPath indexPathForItem:1 inSection:0];
//        
//        [self.collectionView scrollToItemAtIndexPath:newIndexPath atScrollPosition:UICollectionViewScrollPositionTop animated:NO];
//    }

}

@end
