//
//  AccordionView.m
//  InfiniteCollectionView
//
//  Created by Dayoung Jung on 2014. 6. 12..
//  Copyright (c) 2014년 Dayoung Jung. All rights reserved.
//

#import "AccordionView.h"
@interface AccordionView () {
    int mTotalCellsVisible;
}
@end

@implementation AccordionView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)layoutSubviews {

//    mTotalCellsVisible = self.frame.size.height / [self cellForItemAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]].frame.size.height;
    mTotalCellsVisible =self.frame.size.height / 100;
    [self resetContentOffset];
    [super layoutSubviews];
}

- (void)resetContentOffset
{
        NSLog(@"contentsizeheight: %f / bounds: %f/ result : %f", self.contentSize.height, self.bounds.size.height, (self.contentSize.height - self.bounds.size.height));
    NSArray *indexpaths = [self indexPathsForVisibleItems];
    int totalVisibleCells =[indexpaths count];
    if( mTotalCellsVisible > totalVisibleCells )
    {
        //we dont have enough content to generate scroll
        return;
    }
    CGPoint contentOffset  = self.contentOffset;
    
    //check the top condition
    //check if the scroll view reached its top.. if so.. move it to center.. remember center is the start of the data repeating for 2nd time.
    

    
    if( contentOffset.y<=0.0)
    {
        contentOffset.y = self.contentSize.height/3.0f;
    }
    else if( contentOffset.y >= ( self.contentSize.height - self.bounds.size.height) )//scrollview content offset reached bottom minus the height of the tableview
    {
        //this scenario is same as the data repeating for 2nd time minus the height of the table view
        contentOffset.y = self.contentSize.height/3.0f- self.bounds.size.height;
    }
    [self setContentOffset: contentOffset];
}

@end
