//
//  LeadingPageController.m
//  test_oc1
//
//  Created by 刘华龙 on 2017/2/24.
//  Copyright © 2017年 刘华龙. All rights reserved.
//

#import "LeadingPageController.h"

@interface LeadingPageController ()<UICollectionViewDelegate,UICollectionViewDataSource,UIScrollViewDelegate>

@property (copy,nonatomic) SetUpCellHandler setUpCellHandle;
@property (copy,nonatomic) FinishHandler finishHandle;

@property (strong,nonatomic) UICollectionView* collectionView;
@property (strong,nonatomic) UIPageControl* pageControl;
@property (assign,nonatomic) NSInteger count;

@end

static NSString* const cellId = @"LeadingPageCellId";

@implementation LeadingPageController


-(instancetype)initWithPagesCount:(NSInteger)count SetupCellHandler:(SetUpCellHandler)setUpCellHandler FinishHandle:(FinishHandler)finishHandler {
    if (self = [super initWithNibName:nil bundle:nil]) {
        _count = count;
        _setUpCellHandle = setUpCellHandler;
        _finishHandle = finishHandler;
        [self.view addSubview:self.collectionView];
        [self.view addSubview:self.pageControl];
        [self.collectionView registerClass:[LeadingPageCell class] forCellWithReuseIdentifier:cellId];

    }
    return self;
}

-(NSInteger) collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.count;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    LeadingPageCell* cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellId forIndexPath:indexPath];
    if (indexPath.row!=self.count-1) {
        cell.btn.hidden = YES;
    }else{
        cell.btn.hidden = NO;
        [cell.btn addTarget:self action:(@selector(btnClicked:)) forControlEvents:(UIControlEventTouchUpInside)];
    }
    if (_setUpCellHandle) {
        _setUpCellHandle(cell,indexPath);
    }
    return cell;

}
-(void)btnClicked:(UIButton*) btn {
    if (_finishHandle) {
        _finishHandle(btn);
    }

}
-(void)scrollViewDidScroll:(UIScrollView *)scrollView {
    NSInteger currentPage = scrollView.contentOffset.x/scrollView.bounds.size.width+0.5;
    _pageControl.currentPage = currentPage;
}

-(UICollectionView *)collectionView {
    if (!_collectionView) {
        UICollectionViewFlowLayout* layout = [UICollectionViewFlowLayout new];
        layout.itemSize = self.view.bounds.size;
        layout.minimumLineSpacing = 0;
        layout.minimumInteritemSpacing = 0;
        layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;

        _collectionView = [[UICollectionView alloc] initWithFrame:self.view.frame collectionViewLayout:layout];
        _collectionView.pagingEnabled = YES;
        _collectionView.showsHorizontalScrollIndicator = NO;
        _collectionView.bounces = NO;
        _collectionView.dataSource = self;
        _collectionView.delegate = self;
    }
    return _collectionView;
}
-(UIPageControl*)pageControl {
    if (!_pageControl) {
        _pageControl = [[UIPageControl alloc]init];
        _pageControl.numberOfPages = self.count;
        _pageControl.currentPage = 0;
        CGSize pageControlSize = [_pageControl sizeForNumberOfPages:self.count];
        CGFloat pageX = (self.view.bounds.size.width-pageControlSize.width)/2;
        CGFloat pageY = (self.view.bounds.size.height-pageControlSize.height-50);
        _pageControl.frame = CGRectMake(pageX, pageY, pageControlSize.width, pageControlSize.height);
    }
    return _pageControl;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
