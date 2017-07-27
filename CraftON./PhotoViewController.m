//
//  PhotoViewController.m
//  CraftON.
//
//  Created by Alex Wymer  on 2017-07-27.
//  Copyright © 2017 Sav Inc. All rights reserved.
//

#import "PhotoViewController.h"

@interface PhotoViewController () <UIImagePickerControllerDelegate, UINavigationControllerDelegate>

@property (weak, nonatomic) IBOutlet UIImageView *photoImageView;

@property (weak, nonatomic) IBOutlet UITextField *nameTextField;
@property (weak, nonatomic) IBOutlet UITextField *brewerTextField;
@property (weak, nonatomic) IBOutlet UITextField *ABVTextField;
@property (weak, nonatomic) IBOutlet UITextField *categoryTextField;
@property (weak, nonatomic) IBOutlet UITextField *descriptionTextField;

@property (weak, nonatomic) IBOutlet UIButton *addButton;

@end

@implementation PhotoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (IBAction)pickImage:(id)sender {
    
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    
    [UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera];
    
    picker.sourceType = UIImagePickerControllerSourceTypeCamera;
    
    picker.delegate = self; 
    
    [self presentViewController:picker animated:YES completion:^{
        NSLog(@"Picker presented");
    }];
}


-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info {
    
    NSLog(@"Photo Picked %@", info);
    UIImage *pickedImage = info[@"UIImagePickerControllerOriginalImage"];
    self.photoImageView.image = pickedImage;
    [self dismissViewControllerAnimated:YES completion:^{
        
        NSLog(@"Success");
    }]; 
}



- (IBAction)addButtonTapped:(id)sender {
    
    
}


@end
