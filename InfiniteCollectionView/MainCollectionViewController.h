//
//  MainCollectionViewController.h
//  InfiniteCollectionView
//
//  Created by Dayoung on 2014. 6. 10..
//  Copyright (c) 2014년 Dayoung Jung. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AccordionView.h"

@interface MainCollectionViewController : UIViewController <UICollectionViewDataSource>
@property (nonatomic) CGFloat featureHeight;
@property (nonatomic) CGFloat collapsedHeight;
@property (weak, nonatomic) IBOutlet AccordionView *collectionView;
@property (nonatomic) BOOL scrollsToCollapsedRowsOnSelection;
@end
