//
//  ImagePickerViewController.h
//  instant-gram
//
//  Created by Joey R. Hernandez Perez on 7/7/20.
//  Copyright © 2020 joeyrhernandez1. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Post.h"

NS_ASSUME_NONNULL_BEGIN

@protocol ImagePickerViewControllerDelegate <NSObject>

-(void)didPost:(Post *)post;

@end

@interface ImagePickerViewController : UIViewController

@property (weak, nonatomic) id<ImagePickerViewControllerDelegate> delegate;

@end

NS_ASSUME_NONNULL_END
