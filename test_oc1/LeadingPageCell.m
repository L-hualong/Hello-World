//
//  LeadingPageCell.m
//  test_oc1
//
//  Created by 刘华龙 on 2017/2/24.
//  Copyright © 2017年 刘华龙. All rights reserved.
//

#import "LeadingPageCell.h"

@implementation LeadingPageCell

-(instancetype)init {
    if (self = [super init]) {
        [self commonInit];
    }
    return self;
}

-(instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self commonInit];
    }
    return self;
}

-(instancetype)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super initWithCoder:aDecoder]) {
        [self commonInit];
    }
    return self;
}

-(void)commonInit {
    [self.contentView addSubview:self.imageView];
    [self.contentView addSubview:self.btn];
}

-(void)layoutSubviews {
    [super layoutSubviews];
    _imageView.frame = self.contentView.bounds;
    [_btn sizeToFit];

    CGFloat btnHeight = _btn.bounds.size.height+20;
    CGFloat btnWidth = _btn.bounds.size.width+20;
    CGFloat btnX = (self.bounds.size.width-btnWidth)/2;
    CGFloat btnY = self.bounds.size.height-btnHeight-100;
    _btn.frame = CGRectMake(btnX, btnY, btnWidth, btnHeight);
}

-(UIImageView*)imageView {
    if (!_imageView) {
        _imageView = [[UIImageView alloc] init];
        _imageView.contentMode = UIViewContentModeScaleToFill;
    }
    return _imageView;
}
-(UIButton*)btn {
    if (!_btn) {
        _btn = [UIButton new];
        _btn.backgroundColor = [UIColor yellowColor];
        _btn.layer.masksToBounds = YES;
        _btn.layer.cornerRadius = 10;
    }
    return _btn;
}

@end
