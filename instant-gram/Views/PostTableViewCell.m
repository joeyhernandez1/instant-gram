//
//  PostTableViewCell.m
//  instant-gram
//
//  Created by Joey R. Hernandez Perez on 7/7/20.
//  Copyright © 2020 joeyrhernandez1. All rights reserved.
//

#import "PostTableViewCell.h"

@implementation PostTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)setPost:(Post *)post {
    _post = post;
    self.postImage.file = post[@"image"];
    [self.postImage loadInBackground];
}

@end
