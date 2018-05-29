//
//  BuyDetailsViewController.m
//  TicketObject
//
//  Created by 沈阳 on 2018/5/25.
//  Copyright © 2018年 沈阳. All rights reserved.
//

#import "BuyDetailsViewController.h"
#import "BuyDetailsCollectionViewCell.h"
#import "BuyDetailsCollectionReusableView.h"
#import "BuyEnterButtonView.h"

#define CellWidth (WindowWidth - 35) / 6

@interface BuyDetailsViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>{
    NSArray * rowNumberArray;
    NSInteger sectionNumber;
}
@property (nonatomic,strong) NSMutableArray * selectOneArray;
@property (nonatomic,strong) NSMutableArray * selectTwoArray;
@property (nonatomic,strong) UICollectionView * dataCollectionView;
@property (nonatomic,strong) BuyEnterButtonView * buttonView;
@end

@implementation BuyDetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = self.listModel.lottery_name;
    self.selectOneArray = [[NSMutableArray alloc]init];
    self.selectTwoArray = [[NSMutableArray alloc]init];
    sectionNumber = 2;
    rowNumberArray = @[@"33",@"16"];
    [self creatBaseUI];
}
-(void)setListModel:(GetTicketListModel *)listModel{
    _listModel = listModel;
    if ([listModel.lottery_name isEqualToString:@"双色球"]) {
        sectionNumber = 2;
        rowNumberArray = @[@"33",@"16"];
    }
    if ([listModel.lottery_name isEqualToString:@"超级大乐透"]) {
        sectionNumber = 2;
        rowNumberArray = @[@"35",@"12"];
    }
    if ([listModel.lottery_name isEqualToString:@"七乐彩"]) {
        sectionNumber = 1;
        rowNumberArray = @[@"30"];
    }
    if ([listModel.lottery_name isEqualToString:@"福彩3D"]) {
        sectionNumber = 3;
        rowNumberArray = @[@"10",@"10",@"10"];
    }
    if ([listModel.lottery_name isEqualToString:@"七星彩"]) {
        sectionNumber = 2;
        rowNumberArray = @[@"35",@"12"];
    }
    if ([listModel.lottery_name isEqualToString:@"排列3"]) {
        sectionNumber = 3;
        rowNumberArray = @[@"10",@"10",@"10"];
    }
    if ([listModel.lottery_name isEqualToString:@"排列5"]) {
        sectionNumber = 5;
        rowNumberArray = @[@"10",@"10",@"10",@"10",@"10"];
    }
}
-(void)creatBaseUI{
    UICollectionViewFlowLayout * layout = [[UICollectionViewFlowLayout alloc]init];
    layout.scrollDirection = UICollectionViewScrollPositionCenteredHorizontally;
    layout.itemSize = CGSizeMake(CellWidth, CellWidth);
    layout.minimumLineSpacing = 10;
    layout.minimumInteritemSpacing = 5;
    
    self.dataCollectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, WindowWidth, WindowHeight - 80)collectionViewLayout:layout];
    self.dataCollectionView.delegate = self;
    self.dataCollectionView.dataSource = self;
    self.dataCollectionView.backgroundColor = [UIColor blackColor];
    [self.dataCollectionView registerNib:[UINib nibWithNibName:NSStringFromClass([BuyDetailsCollectionViewCell class]) bundle:nil] forCellWithReuseIdentifier:NSStringFromClass([BuyDetailsCollectionViewCell class])];
    [self.dataCollectionView registerNib:[UINib nibWithNibName:NSStringFromClass([BuyDetailsCollectionReusableView class]) bundle:nil] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:NSStringFromClass([BuyDetailsCollectionReusableView class])];
    [self.view addSubview:self.dataCollectionView];
    
    self.buttonView.frame = CGRectMake(0, WindowHeight - 80, WindowWidth, 80);
    [self.view addSubview:self.buttonView];
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
    return CGSizeMake(30, 30);
}
-(UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    
    BuyDetailsCollectionReusableView * headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:NSStringFromClass([BuyDetailsCollectionReusableView class]) forIndexPath:indexPath];
    if (indexPath.section == 0) {
        headerView.lineLabel.hidden = NO;
        headerView.titleLabel.text = @"红球";
    }else if (indexPath.section == 1){
        headerView.lineLabel.hidden = YES;
        headerView.titleLabel.text = @"蓝球";
    }
    return headerView;
}
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return sectionNumber;
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return [rowNumberArray[section] integerValue];
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    BuyDetailsCollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([BuyDetailsCollectionViewCell class]) forIndexPath:indexPath];
    cell.textLabel.text = [NSString stringWithFormat:@"%ld",indexPath.row + 1];
    if (indexPath.section == 0) {
        [cell.textLabel.layer setBorderColor:[UIColor redColor].CGColor];
        if ([self.selectOneArray containsObject:[NSString stringWithFormat:@"%ld",indexPath.row + 1]]) {
            cell.textLabel.backgroundColor = [UIColor redColor];
            cell.textLabel.textColor = [UIColor whiteColor];
        }else{
            cell.textLabel.backgroundColor = UIColorWithRGB(230, 230, 230, 1);
            cell.textLabel.textColor = [UIColor redColor];
        }
    }else if (indexPath.section == 1){
        [cell.textLabel.layer setBorderColor:[UIColor blueColor].CGColor];
        if ([self.selectTwoArray containsObject:[NSString stringWithFormat:@"%ld",indexPath.row + 1]]) {
            cell.textLabel.backgroundColor = [UIColor blueColor];
            cell.textLabel.textColor = [UIColor whiteColor];
        }else{
            cell.textLabel.backgroundColor = UIColorWithRGB(230, 230, 230, 1);
            cell.textLabel.textColor = [UIColor blueColor];
        }
    }
    return cell;
}
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        if ([self.selectOneArray containsObject:[NSString stringWithFormat:@"%ld",indexPath.row + 1]]) {
            [self.selectOneArray removeObject:[NSString stringWithFormat:@"%ld",indexPath.row + 1]];
        }else{
            [self.selectOneArray addObject:[NSString stringWithFormat:@"%ld",indexPath.row + 1]];
        }
    }else if (indexPath.section == 1){
        if ([self.selectTwoArray containsObject:[NSString stringWithFormat:@"%ld",indexPath.row + 1]]) {
            [self.selectTwoArray removeObject:[NSString stringWithFormat:@"%ld",indexPath.row + 1]];
        }else{
            [self.selectTwoArray addObject:[NSString stringWithFormat:@"%ld",indexPath.row + 1]];
        }
    }
    self.buttonView.redlabel.text = [self.selectOneArray componentsJoinedByString:@","];
    self.buttonView.blueLabel.text = [self.selectTwoArray componentsJoinedByString:@","];
    [self.dataCollectionView reloadData];
}
-(void)senderButtonAction{
    
}
-(BuyEnterButtonView *)buttonView{
    if (!_buttonView) {
        _buttonView = [[[NSBundle mainBundle]loadNibNamed:NSStringFromClass([BuyEnterButtonView class]) owner:self options:0]lastObject];
        [_buttonView.senderButton addTarget:self action:@selector(senderButtonAction) forControlEvents:UIControlEventTouchUpInside];
    }
    return _buttonView;
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
