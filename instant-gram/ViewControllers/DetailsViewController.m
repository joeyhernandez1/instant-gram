//
//  DetailsViewController.m
//  instant-gram
//
//  Created by Joey R. Hernandez Perez on 7/9/20.
//  Copyright © 2020 joeyrhernandez1. All rights reserved.
//

#import "DetailsViewController.h"
#import "Post.h"
#import "NSDate+DateTools.h"

@import Parse;

@interface DetailsViewController ()

@property (weak, nonatomic) IBOutlet PFImageView *postImageView;
@property (weak, nonatomic) IBOutlet UILabel *usernameLabel;
@property (weak, nonatomic) IBOutlet UILabel *captionLabel;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;
@end

@implementation DetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.postImageView.file = self.post.image;
    [self.postImageView loadInBackground];
    self.captionLabel.text = self.post.caption;
    self.usernameLabel.text = self.post.author.username;
    self.dateLabel.text = [self.post.createdAt shortTimeAgoSinceNow];
}

@end
