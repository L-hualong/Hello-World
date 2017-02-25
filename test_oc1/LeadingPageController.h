//
//  LeadingPageController.h
//  test_oc1
//
//  Created by 刘华龙 on 2017/2/24.
//  Copyright © 2017年 刘华龙. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LeadingPageCell.h"
typedef void (^SetUpCellHandler)(LeadingPageCell* cell, NSIndexPath* indexPath);
typedef void (^FinishHandler)(UIButton* btn);

@interface LeadingPageController : UIViewController

@property (strong,nonatomic,readonly) UICollectionView* collectionView;
@property (strong,nonatomic,readonly) UIPageControl* pageControl;
@property (assign,nonatomic,readonly) NSInteger count;

-(instancetype) initWithPagesCount:(NSInteger)count SetupCellHandler:(SetUpCellHandler)setUpCellHandler FinishHandle:(FinishHandler)finishHandler;

@end
