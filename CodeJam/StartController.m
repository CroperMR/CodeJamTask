//
//  AppDelegate.m
//  CodeJam
//
//  Created by LESHA on 5/31/18.
//  Copyright © 2018 Lesha Elin. All rights reserved.
//

#import "StartController.h"
#import <QuartzCore/QuartzCore.h>


@interface StartController ()

@property (weak, nonatomic) UIImageView *downloadArea;
@property (weak, nonatomic) UIImageView *downloadAreaTwo;
@property (weak, nonatomic) UIImageView *downloadAreaThree;
@property (weak, nonatomic) UIImageView *downloadAreaFour;
@property (weak, nonatomic) UIImageView *downloadAreaFive;
@property (weak, nonatomic) UIImageView *downloadAreaSix;
@property (weak, nonatomic) UIActivityIndicatorView *downloadIndicator;

- (void)views;
- (void)startDownload;

@end

@implementation StartController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setTitle:@"Download Controller"];
    
    CGRect frame = CGRectMake(0, 0, 130, 40);
    UIColor* naivyBlue = [[UIColor alloc] initWithRed:41/255.f green:153/255.f blue:172/255.f alpha:1];
    
    UIButton *startButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    startButton.layer.cornerRadius = 10;
    startButton.clipsToBounds = YES;
    startButton.frame = frame;
    [startButton setCenter:CGPointMake([[self view] center].x, [[self view] center].y +50)];
    [startButton setTitle:@"Download images" forState:UIControlStateNormal];
    [startButton setTitleColor:[UIColor whiteColor] forState:(UIControlStateNormal)];
    startButton.tag = 2;
    [startButton setBackgroundColor:naivyBlue];
    [startButton addTarget:self action:@selector(startDownload) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview: startButton];
    
    self.view.backgroundColor = UIColor.whiteColor;
    [self views];
    
    [startButton release];
    [naivyBlue release];
}

- (void)views {
    
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
    UIColor *lightGray = [[UIColor alloc] initWithRed:227/255.f green:227/255.f blue:227/255.f alpha:1];
    [lightGray autorelease];
    
    self.downloadArea = [[[UIImageView alloc] init] autorelease];
    self.downloadArea.backgroundColor = lightGray;
    self.downloadArea.layer.cornerRadius = 10.0;
    self.downloadArea.contentMode = UIViewContentModeScaleAspectFit;
    
    self.downloadAreaTwo = [[[UIImageView alloc] init] autorelease];
    self.downloadAreaTwo.backgroundColor = [UIColor greenColor];
    self.downloadAreaTwo.layer.cornerRadius = 10.0;
    self.downloadAreaTwo.contentMode = UIViewContentModeScaleAspectFit;
    
    self.downloadAreaThree = [[[UIImageView alloc] init] autorelease];
    self.downloadAreaThree.backgroundColor = [UIColor grayColor];
    self.downloadAreaThree.layer.cornerRadius = 10.0;
    self.downloadAreaThree.contentMode = UIViewContentModeScaleAspectFit;
    
    self.downloadAreaFour = [[[UIImageView alloc] init] autorelease];
    self.downloadAreaFour.backgroundColor = [UIColor redColor];
    self.downloadAreaFour.layer.cornerRadius = 10.0;
    self.downloadAreaFour.contentMode = UIViewContentModeScaleAspectFit;
    
    self.downloadAreaFive = [[[UIImageView alloc] init] autorelease];
    self.downloadAreaFive.backgroundColor = [UIColor magentaColor];
    self.downloadAreaFive.layer.cornerRadius = 10.0;
    self.downloadAreaFive.contentMode = UIViewContentModeScaleAspectFit;
    
    self.downloadAreaSix = [[[UIImageView alloc] init] autorelease];
    self.downloadAreaSix.backgroundColor = [UIColor cyanColor];
    self.downloadAreaSix.layer.cornerRadius = 10.0;
    self.downloadAreaSix.contentMode = UIViewContentModeScaleAspectFit;
    
    self.downloadIndicator = [[[UIActivityIndicatorView alloc] init]autorelease];
    self.downloadIndicator.hidesWhenStopped = YES;
    self.downloadIndicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyleWhiteLarge;
    self.downloadIndicator.color = UIColor.redColor;
    
    
    [self.view addSubview:self.downloadArea];
    self.downloadArea.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:self.downloadAreaTwo];
    self.downloadAreaTwo.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:self.downloadAreaThree];
    self.downloadAreaThree.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:self.downloadAreaFour];
    self.downloadAreaFour.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:self.downloadAreaFive];
    self.downloadAreaFive.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:self.downloadAreaSix];
    self.downloadAreaSix.translatesAutoresizingMaskIntoConstraints = NO;
    
    
    NSLayoutConstraint *leftImageViewConstraint = [NSLayoutConstraint constraintWithItem:self.downloadArea
                                                                               attribute:NSLayoutAttributeLeft
                                                                               relatedBy:NSLayoutRelationEqual
                                                                                  toItem:self.view
                                                                               attribute:NSLayoutAttributeLeft
                                                                              multiplier:1.0
                                                                                constant:10.0];
    NSLayoutConstraint *topImageViewConstraint = [NSLayoutConstraint constraintWithItem:self.downloadArea
                                                                              attribute:NSLayoutAttributeTop
                                                                              relatedBy:NSLayoutRelationEqual
                                                                                 toItem:self.view
                                                                              attribute:NSLayoutAttributeTop
                                                                             multiplier:1.0
                                                                               constant:80.0];
    NSLayoutConstraint *rightImageViewConstraint = [NSLayoutConstraint constraintWithItem:self.downloadArea
                                                                                attribute:NSLayoutAttributeRight
                                                                                relatedBy:NSLayoutRelationEqual
                                                                                   toItem:self.view
                                                                                attribute:NSLayoutAttributeRight
                                                                               multiplier:1.0
                                                                                 constant:-170.0];
    NSLayoutConstraint *heightImageViewConstraint = [NSLayoutConstraint constraintWithItem:self.downloadArea
                                                                                 attribute:NSLayoutAttributeHeight
                                                                                 relatedBy:NSLayoutRelationEqual
                                                                                    toItem:nil
                                                                                 attribute:NSLayoutAttributeNotAnAttribute
                                                                                multiplier:1.0
                                                                                  constant:100.0];
    [self.view addConstraints:@[leftImageViewConstraint,
                                topImageViewConstraint,
                                rightImageViewConstraint,
                                heightImageViewConstraint]];
    
    NSLayoutConstraint *leftImageViewConstraint2 = [NSLayoutConstraint constraintWithItem:self.downloadAreaTwo
                                                                                attribute:NSLayoutAttributeLeft
                                                                                relatedBy:NSLayoutRelationEqual
                                                                                   toItem:self.view
                                                                                attribute:NSLayoutAttributeLeft
                                                                               multiplier:1.0
                                                                                 constant:170.0];
    NSLayoutConstraint *topImageViewConstraint2 = [NSLayoutConstraint constraintWithItem:self.downloadAreaTwo
                                                                               attribute:NSLayoutAttributeTop
                                                                               relatedBy:NSLayoutRelationEqual
                                                                                  toItem:self.view
                                                                               attribute:NSLayoutAttributeTop
                                                                              multiplier:1.0
                                                                                constant:80.0];
    NSLayoutConstraint *rightImageViewConstraint2 = [NSLayoutConstraint constraintWithItem:self.downloadAreaTwo
                                                                                 attribute:NSLayoutAttributeRight
                                                                                 relatedBy:NSLayoutRelationEqual
                                                                                    toItem:self.view
                                                                                 attribute:NSLayoutAttributeRight
                                                                                multiplier:1.0
                                                                                  constant:-10.0];
    NSLayoutConstraint *heightImageViewConstrain2 = [NSLayoutConstraint constraintWithItem:self.downloadAreaTwo
                                                                                 attribute:NSLayoutAttributeHeight
                                                                                 relatedBy:NSLayoutRelationEqual
                                                                                    toItem:nil
                                                                                 attribute:NSLayoutAttributeNotAnAttribute
                                                                                multiplier:1.0
                                                                                  constant:100.0];
    [self.view addConstraints:@[leftImageViewConstraint2,
                                topImageViewConstraint2,
                                rightImageViewConstraint2,
                                heightImageViewConstrain2]];
    
    NSLayoutConstraint *leftImageViewConstraint3 = [NSLayoutConstraint constraintWithItem:self.downloadAreaThree
                                                                                attribute:NSLayoutAttributeLeft
                                                                                relatedBy:NSLayoutRelationEqual
                                                                                   toItem:self.view
                                                                                attribute:NSLayoutAttributeLeft
                                                                               multiplier:1.0
                                                                                 constant:170.0];
    NSLayoutConstraint *topImageViewConstraint3 = [NSLayoutConstraint constraintWithItem:self.downloadAreaThree
                                                                               attribute:NSLayoutAttributeTop
                                                                               relatedBy:NSLayoutRelationEqual
                                                                                  toItem:self.view
                                                                               attribute:NSLayoutAttributeTop
                                                                              multiplier:1.0
                                                                                constant:200.0];
    NSLayoutConstraint *rightImageViewConstraint3 = [NSLayoutConstraint constraintWithItem:self.downloadAreaThree
                                                                                 attribute:NSLayoutAttributeRight
                                                                                 relatedBy:NSLayoutRelationEqual
                                                                                    toItem:self.view
                                                                                 attribute:NSLayoutAttributeRight
                                                                                multiplier:1.0
                                                                                  constant:-10.0];
    NSLayoutConstraint *heightImageViewConstrain3 = [NSLayoutConstraint constraintWithItem:self.downloadAreaThree
                                                                                 attribute:NSLayoutAttributeHeight
                                                                                 relatedBy:NSLayoutRelationEqual
                                                                                    toItem:nil
                                                                                 attribute:NSLayoutAttributeNotAnAttribute
                                                                                multiplier:1.0
                                                                                  constant:100.0];
    [self.view addConstraints:@[leftImageViewConstraint3,
                                topImageViewConstraint3,
                                rightImageViewConstraint3,
                                heightImageViewConstrain3]];
    
    NSLayoutConstraint *leftImageViewConstraint4 = [NSLayoutConstraint constraintWithItem:self.downloadAreaFour
                                                                                attribute:NSLayoutAttributeLeft
                                                                                relatedBy:NSLayoutRelationEqual
                                                                                   toItem:self.view
                                                                                attribute:NSLayoutAttributeLeft
                                                                               multiplier:1.0
                                                                                 constant:10.0];
    NSLayoutConstraint *topImageViewConstraint4 = [NSLayoutConstraint constraintWithItem:self.downloadAreaFour
                                                                               attribute:NSLayoutAttributeTop
                                                                               relatedBy:NSLayoutRelationEqual
                                                                                  toItem:self.view
                                                                               attribute:NSLayoutAttributeTop
                                                                              multiplier:1.0
                                                                                constant:200.0];
    NSLayoutConstraint *rightImageViewConstraint4 = [NSLayoutConstraint constraintWithItem:self.downloadAreaFour
                                                                                 attribute:NSLayoutAttributeRight
                                                                                 relatedBy:NSLayoutRelationEqual
                                                                                    toItem:self.view
                                                                                 attribute:NSLayoutAttributeRight
                                                                                multiplier:1.0
                                                                                  constant:-170.0];
    NSLayoutConstraint *heightImageViewConstrain4 = [NSLayoutConstraint constraintWithItem:self.downloadAreaFour
                                                                                 attribute:NSLayoutAttributeHeight
                                                                                 relatedBy:NSLayoutRelationEqual
                                                                                    toItem:nil
                                                                                 attribute:NSLayoutAttributeNotAnAttribute
                                                                                multiplier:1.0
                                                                                  constant:100.0];
    [self.view addConstraints:@[leftImageViewConstraint4,
                                topImageViewConstraint4,
                                rightImageViewConstraint4,
                                heightImageViewConstrain4]];
    
    NSLayoutConstraint *leftImageViewConstraint5 = [NSLayoutConstraint constraintWithItem:self.downloadAreaFive
                                                                                attribute:NSLayoutAttributeLeft
                                                                                relatedBy:NSLayoutRelationEqual
                                                                                   toItem:self.view
                                                                                attribute:NSLayoutAttributeLeft
                                                                               multiplier:1.0
                                                                                 constant:170.0];
    NSLayoutConstraint *topImageViewConstraint5 = [NSLayoutConstraint constraintWithItem:self.downloadAreaFive
                                                                               attribute:NSLayoutAttributeTop
                                                                               relatedBy:NSLayoutRelationEqual
                                                                                  toItem:self.view
                                                                               attribute:NSLayoutAttributeTop
                                                                              multiplier:1.0
                                                                                constant:380.0];
    NSLayoutConstraint *rightImageViewConstraint5 = [NSLayoutConstraint constraintWithItem:self.downloadAreaFive
                                                                                 attribute:NSLayoutAttributeRight
                                                                                 relatedBy:NSLayoutRelationEqual
                                                                                    toItem:self.view
                                                                                 attribute:NSLayoutAttributeRight
                                                                                multiplier:1.0
                                                                                  constant:-10.0];
    NSLayoutConstraint *heightImageViewConstrain5 = [NSLayoutConstraint constraintWithItem:self.downloadAreaFive
                                                                                 attribute:NSLayoutAttributeHeight
                                                                                 relatedBy:NSLayoutRelationEqual
                                                                                    toItem:nil
                                                                                 attribute:NSLayoutAttributeNotAnAttribute
                                                                                multiplier:1.0
                                                                                  constant:100.0];
    [self.view addConstraints:@[leftImageViewConstraint5,
                                topImageViewConstraint5,
                                rightImageViewConstraint5,
                                heightImageViewConstrain5]];
    
    
    NSLayoutConstraint *leftImageViewConstraint6 = [NSLayoutConstraint constraintWithItem:self.downloadAreaSix
                                                                                attribute:NSLayoutAttributeLeft
                                                                                relatedBy:NSLayoutRelationEqual
                                                                                   toItem:self.view
                                                                                attribute:NSLayoutAttributeLeft
                                                                               multiplier:1.0
                                                                                 constant:10.0];
    NSLayoutConstraint *topImageViewConstraint6 = [NSLayoutConstraint constraintWithItem:self.downloadAreaSix
                                                                               attribute:NSLayoutAttributeTop
                                                                               relatedBy:NSLayoutRelationEqual
                                                                                  toItem:self.view
                                                                               attribute:NSLayoutAttributeTop
                                                                              multiplier:1.0
                                                                                constant:380.0];
    NSLayoutConstraint *rightImageViewConstraint6 = [NSLayoutConstraint constraintWithItem:self.downloadAreaSix
                                                                                 attribute:NSLayoutAttributeRight
                                                                                 relatedBy:NSLayoutRelationEqual
                                                                                    toItem:self.view
                                                                                 attribute:NSLayoutAttributeRight
                                                                                multiplier:1.0
                                                                                  constant:-170.0];
    NSLayoutConstraint *heightImageViewConstrain6 = [NSLayoutConstraint constraintWithItem:self.downloadAreaSix
                                                                                 attribute:NSLayoutAttributeHeight
                                                                                 relatedBy:NSLayoutRelationEqual
                                                                                    toItem:nil
                                                                                 attribute:NSLayoutAttributeNotAnAttribute
                                                                                multiplier:1.0
                                                                                  constant:100.0];
    [self.view addConstraints:@[leftImageViewConstraint6,
                                topImageViewConstraint6,
                                rightImageViewConstraint6,
                                heightImageViewConstrain6]];
    
    [self.view addSubview:self.downloadIndicator];
    [pool release];
}

- (void)startDownload {
   
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSURL *imageUrl = [NSURL URLWithString:@"https://s.dou.ua/img/announces/epam-university-840_EvEN7E8.png"];
        NSData *imageDate = [NSData dataWithContentsOfURL:imageUrl];
        UIImage *image = [UIImage imageWithData:imageDate];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            UIImageView *imageHolder = [[[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 135, 95)] autorelease];
            imageHolder.image = image;
            [self.downloadArea addSubview:imageHolder];
        });
    });
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSURL *imageUrl = [NSURL URLWithString:@"https://www.epam-group.ru/content/dam/epam/careers/infographics/Training.png"];
        NSData *imageDate = [NSData dataWithContentsOfURL:imageUrl];
        UIImage *image = [UIImage imageWithData:imageDate];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            UIImageView *imageHolder = [[[UIImageView alloc] initWithFrame:CGRectMake(20, 0, 100, 100)] autorelease];
            imageHolder.image = image;
            [self.downloadAreaTwo addSubview:imageHolder];
        });
    });
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSURL *imageUrl = [NSURL URLWithString:@"https://training.by/Content/images/BigLogo/fd499c27-b491-49c3-b69c-2fa3c9911bddDevOps_training.png"];
        NSData *imageDate = [NSData dataWithContentsOfURL:imageUrl];
        UIImage *image = [UIImage imageWithData:imageDate];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            UIImageView *imageHolder = [[[UIImageView alloc] initWithFrame:CGRectMake(20, 0, 100, 100)] autorelease];
            imageHolder.image = image;
            [self.downloadAreaThree addSubview:imageHolder];
        });
    });
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSURL *imageUrl = [NSURL URLWithString:@"https://training.by/Content/images/BigLogo/6224255d-5405-4167-a80d-faad8c9c8d5fJava_training.png"];
        NSData *imageDate = [NSData dataWithContentsOfURL:imageUrl];
        UIImage *image = [UIImage imageWithData:imageDate];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            UIImageView *imageHolder = [[[UIImageView alloc] initWithFrame:CGRectMake(20, 0, 100, 100)] autorelease];
            imageHolder.image = image;
            [self.downloadAreaFour addSubview:imageHolder];
        });
    });
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSURL *imageUrl = [NSURL URLWithString:@"https://training.by/Content/images/BigLogo/de4b5b93-17e9-46e7-be88-1fac47be137aTest%20Automation_training.png"];
        NSData *imageDate = [NSData dataWithContentsOfURL:imageUrl];
        UIImage *image = [UIImage imageWithData:imageDate];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            UIImageView *imageHolder = [[[UIImageView alloc] initWithFrame:CGRectMake(20, 0, 100, 100)] autorelease];
            imageHolder.image = image;
            [self.downloadAreaFive addSubview:imageHolder];
        });
    });
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSURL *imageUrl = [NSURL URLWithString:@"https://training.by/Content/images/BigLogo/f0c0150c-b28a-4e33-96de-3ab5c09b9807BI_training.png"];
        NSData *imageDate = [NSData dataWithContentsOfURL:imageUrl];
        UIImage *image = [UIImage imageWithData:imageDate];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            UIImageView *imageHolder = [[[UIImageView alloc] initWithFrame:CGRectMake(20, 0, 100, 100)] autorelease];
            imageHolder.image = image;
            [self.downloadAreaSix addSubview:imageHolder];
        });
    });
    
    
    [self.downloadIndicator startAnimating];
   
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}
@end
