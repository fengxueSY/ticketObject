//
//  NewsTableViewCell.m
//  TicketObject
//
//  Created by 沈阳 on 2018/5/28.
//  Copyright © 2018年 沈阳. All rights reserved.
//

#import "NewsTableViewCell.h"

@implementation NewsTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
-(void)setListModel:(GetNewsListModel *)listModel{
    _listModel = listModel;
    self.titleLabel.text = listModel.title;
    self.timeLabel.text = listModel.time;
    self.scrLabel.text = listModel.src;
    self.contextLabel.text = [self flattenHTML:listModel.content trimWhiteSpace:YES];
    if ([listModel.pic length] > 0) {
        self.headerImageView.hidden = NO;
        [self.headerImageView sd_setImageWithURL:[NSURL URLWithString:listModel.pic] placeholderImage:placeImage];
    }else{
        self.headerImageView.hidden = YES;
    }
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
-(NSString *)flattenHTML:(NSString *)html trimWhiteSpace:(BOOL)trim{
    NSScanner *theScanner = [NSScanner scannerWithString:html];       NSString *text = nil;
    while ([theScanner isAtEnd] == NO) {           // find start of tag
        [theScanner scanUpToString:@"<" intoString:NULL] ;           // find end of tag
        [theScanner scanUpToString:@">" intoString:&text] ;           // replace the found tag with a space           //(you can filter multi-spaces out later if you wish)
        html = [html stringByReplacingOccurrencesOfString:                   [ NSString stringWithFormat:@"%@>", text]                                                  withString:@""];
        
    }
    return trim ? [html stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] : html;
}

@end
