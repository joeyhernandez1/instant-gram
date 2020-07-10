//
//  DetailsViewController.h
//  instant-gram
//
//  Created by Joey R. Hernandez Perez on 7/9/20.
//  Copyright © 2020 joeyrhernandez1. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Post.h"

NS_ASSUME_NONNULL_BEGIN

@interface DetailsViewController : UIViewController

@property (strong, nonatomic) Post *post;

@end

NS_ASSUME_NONNULL_END
