//
//  ImagePickerViewController.m
//  instant-gram
//
//  Created by Joey R. Hernandez Perez on 7/7/20.
//  Copyright © 2020 joeyrhernandez1. All rights reserved.
//

#import "ImagePickerViewController.h"
#import "Post.h"

@interface ImagePickerViewController () <UIImagePickerControllerDelegate,
                                         UINavigationControllerDelegate>

@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UITextView *captionField;

@end

@implementation ImagePickerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self pickImage];
}

-(void) viewWillAppear:(BOOL)animated {
    self.captionField.text = @"";
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info {
    
    // Get the image captured by the UIImagePickerController
    UIImage *originalImage = info[UIImagePickerControllerOriginalImage];
    //UIImage *editedImage = info[UIImagePickerControllerEditedImage];
    
    if (originalImage) {
        self.imageView.image = originalImage;
        CGSize size = CGSizeMake(500, 500);
        [self resizeImage:originalImage withSize:size];
    }

    // Do something with the images (based on your use case)
    
    // Dismiss UIImagePickerController to go back to your original view controller
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void) pickImage {
    UIImagePickerController *imagePickerVC = [UIImagePickerController new];
    imagePickerVC.delegate = self;
    imagePickerVC.allowsEditing = YES;
    imagePickerVC.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;

    [self presentViewController:imagePickerVC animated:YES completion:nil];
}

- (UIImage *)resizeImage:(UIImage *)image withSize:(CGSize)size {
    UIImageView *resizeImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, size.width, size.height)];
    
    resizeImageView.contentMode = UIViewContentModeScaleAspectFill;
    resizeImageView.image = image;
    
    UIGraphicsBeginImageContext(size);
    [resizeImageView.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return newImage;
}

- (IBAction)onShareTap:(id)sender {
    [Post postUserImage:self.imageView.image withCaption:self.captionField.text withCompletion:^(BOOL succeeded, NSError * _Nullable error) {
        if (error) {
            NSLog(@"Error: %@", error.localizedDescription);
        }
        else {
            NSLog(@"Post successful!");
            [self dismissViewControllerAnimated:YES completion:nil];
        }
    }];
}

- (IBAction)onCancelTap:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
