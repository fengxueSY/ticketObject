//
//  HomeViewController.m
//  TicketObject
//
//  Created by 沈阳 on 2018/5/16.
//  Copyright © 2018年 沈阳. All rights reserved.
//

#import "HomeViewController.h"
#import "CollectionFirstSectionHeaderView.h"
#import "ShowTicketCollectionViewCell.h"
#import "GetTicketListModel.h"
#import "HistoryViewController.h"

#define CellWidth (WindowWidth - 20) / 3

@interface HomeViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>
@property (nonatomic,strong) UICollectionView * dataCollectionView;
@property (nonatomic,strong) ADScrollViewComponent * scrollView;
@property (nonatomic,strong) NSMutableArray * dataArray;
@property (nonatomic,copy) NSArray * imageArray;
@end

@implementation HomeViewController

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.tabBarController.tabBar.hidden = NO;
    self.imageArray = @[@"125_74_双色球",@"125_74大乐透",@"125_74福彩3d",@"125_74排列三",@"125_74排列五",@"125_74七彩乐",@"125_74七星彩"];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.barTintColor = [UIColor blackColor];
    self.dataArray = [[NSMutableArray alloc]init];
    [self getHttpsData];
    [self creatBaseUI];
}
-(void)getHttpsData{
    __weak typeof(self) wself = self;
    [GetTicketListModel getTicketListSucceed:^(id succeed) {
        __strong typeof(wself) sself = wself;
        sself.dataArray = (NSMutableArray *)succeed;
        [sself.dataCollectionView reloadData];
    } Fail:^(id failed) {
        NSLog(@"%@", failed);
    }];
}
-(void)creatBaseUI{
    NSArray * imageArray = @[@"375_135_1",@"375_135_2",@"375_135_3"];
    self.scrollView = [ADScrollViewComponent adScrollViewWithFrame:CGRectMake(0, 0, WindowWidth, 135) imageItems:imageArray andImageClickCallBack:^(NSInteger index) {
        
    }];
    UICollectionViewFlowLayout * layout = [[UICollectionViewFlowLayout alloc]init];
    layout.scrollDirection = UICollectionViewScrollPositionCenteredHorizontally;
    layout.itemSize = CGSizeMake(CellWidth, CellWidth);
    layout.minimumLineSpacing = 10;
    layout.minimumInteritemSpacing = 10;
    
    self.dataCollectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, WindowWidth, WindowHeight)collectionViewLayout:layout];
    self.dataCollectionView.delegate = self;
    self.dataCollectionView.dataSource = self;
    self.dataCollectionView.backgroundColor = [UIColor blackColor];
    [self.dataCollectionView registerNib:[UINib nibWithNibName:NSStringFromClass([ShowTicketCollectionViewCell class]) bundle:nil] forCellWithReuseIdentifier:NSStringFromClass([ShowTicketCollectionViewCell class])];
    [self.dataCollectionView registerNib:[UINib nibWithNibName:NSStringFromClass([CollectionFirstSectionHeaderView class]) bundle:nil] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:NSStringFromClass([CollectionFirstSectionHeaderView class])];
    [self.view addSubview:self.dataCollectionView];
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
    return CGSizeMake(135, 135);
}
-(UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
        CollectionFirstSectionHeaderView * headerView = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:NSStringFromClass([CollectionFirstSectionHeaderView class]) forIndexPath:indexPath];
        [headerView addSubview:self.scrollView];
        return headerView;
    }else{
        return [UICollectionReusableView new];
    }
}
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.dataArray.count;
    return 7;
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    ShowTicketCollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([ShowTicketCollectionViewCell class]) forIndexPath:indexPath];
    cell.headImageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@",self.imageArray[indexPath.row]]];
    GetTicketListModel * model = self.dataArray[indexPath.row];
    cell.listModel = model;
    return cell;
}
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    GetTicketListModel * model = self.dataArray[indexPath.row];
    HistoryViewController * history = [[HistoryViewController alloc]init];
    history.listModel = model;
    [self.navigationController pushViewController:history animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
