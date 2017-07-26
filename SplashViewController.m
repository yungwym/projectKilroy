//
//  SplashViewController.m
//  CraftON.
//
//  Created by Alex Wymer  on 2017-07-24.
//  Copyright © 2017 Sav Inc. All rights reserved.
//

#import "SplashViewController.h"

@interface SplashViewController ()

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UIImageView *pintImageView;

@property (weak, nonatomic) IBOutlet UIImageView *bubble2ImageView;
@property (weak, nonatomic) IBOutlet UIImageView *bubble1ImageView;
@property (weak, nonatomic) IBOutlet UIImageView *blueCoverImageView;
@property (weak, nonatomic) IBOutlet UIImageView *bubble3ImageView;
@property (weak, nonatomic) IBOutlet UIImageView *bubble4ImageView;

@end

@implementation SplashViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (IBAction)pintTapped:(UIButton *)sender {
    
    
    [UIView animateWithDuration:1.0
                          delay:0.0
                        options:UIViewAnimationOptionCurveEaseIn
                     animations:^{
                         
                         self.blueCoverImageView.alpha = 0;
                          //self.blueCoverImageView.frame = CGRectMake(self.blueCoverImageView.frame.origin.x, self.blueCoverImageView.frame.origin.y - 500, self.blueCoverImageView.frame.size.width, self.blueCoverImageView.frame.size.height);
                     }
                     completion:^(BOOL finished) {
                         
                         [UIView animateWithDuration:1.0
                                               delay:0.0
                                             options:UIViewAnimationOptionCurveEaseIn
                                          animations:^{
                                              self.bubble1ImageView.frame = CGRectMake(self.bubble1ImageView.frame.origin.x, self.bubble1ImageView.frame.origin.y - 41, self.bubble1ImageView.frame.size.width, self.bubble1ImageView.frame.size.height);
                                              self.bubble2ImageView.frame = CGRectMake(self.bubble2ImageView.frame.origin.x, self.bubble2ImageView.frame.origin.y - 40, self.bubble2ImageView.frame.size.width, self.bubble2ImageView.frame.size.height);
                                              self.bubble3ImageView.frame = CGRectMake(self.bubble3ImageView.frame.origin.x, self.bubble3ImageView.frame.origin.y - 40, self.bubble3ImageView.frame.size.width, self.bubble3ImageView.frame.size.height);
                                              self.bubble4ImageView.frame = CGRectMake(self.bubble4ImageView.frame.origin.x, self.bubble4ImageView.frame.origin.y - 40, self.bubble4ImageView.frame.size.width, self.bubble4ImageView.frame.size.height);
                                          }
                                          completion:^(BOOL finished) {
                                              
                                             
                                              
                                              [self performSelector:@selector(showMenu) withObject:nil afterDelay:0.4];
                                              
                                               
                                          }];
                     }];
}


-(void)showMenu {
    [self performSegueWithIdentifier:@"enter" sender:nil];
}

@end
