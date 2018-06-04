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

@property (nonatomic, retain) NSArray<UIImageView*> *imageViewArray;
@property (nonatomic, retain) NSMutableArray<UIImage*> *images;

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
    [startButton setCenter:CGPointMake([[self view] center].x -70 , [[self view] center].y +140)];
    [startButton setTitle:@"Download images" forState:UIControlStateNormal];
    [startButton setTitleColor:[UIColor whiteColor] forState:(UIControlStateNormal)];
    [startButton setBackgroundColor:naivyBlue];
    [startButton addTarget:self action:@selector(startDownload) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview: startButton];
    
    
    UIButton *refreshButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    refreshButton.layer.cornerRadius = 10;
    refreshButton.clipsToBounds = YES;
    refreshButton.frame = frame;
    [refreshButton setCenter:CGPointMake([[self view] center].x + 70, [[self view] center].y +140)];
    [refreshButton setTitle:@"Clear" forState:UIControlStateNormal];
    [refreshButton setTitleColor:[UIColor whiteColor] forState:(UIControlStateNormal)];
    [refreshButton setBackgroundColor:naivyBlue];
    [refreshButton addTarget:self action:@selector(refresh:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview: refreshButton];
    
    UIBarButtonItem *button = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemRefresh target:self action:@selector(refresh:)];
    self.navigationItem.rightBarButtonItem = button;
    
    self.view.backgroundColor = UIColor.whiteColor;
    [self views];
    
    [startButton release];
    [refreshButton release];
    [naivyBlue release];
}

- (void)views {
    
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
    
    UIView *center = [[[UIView alloc] initWithFrame:CGRectMake(0, 0, 1, 1)]autorelease];
    [center setCenter:CGPointMake([[self view] center].x, [[self view] center].y)];
    [self.view addSubview:center];
    
    self.downloadArea = [[[UIImageView alloc] init] autorelease];
    self.downloadArea.backgroundColor = [UIColor clearColor];
    self.downloadArea.layer.cornerRadius = 10.0;
    self.downloadArea.contentMode = UIViewContentModeScaleAspectFit;
    
    self.downloadAreaTwo = [[[UIImageView alloc] init] autorelease];
    self.downloadAreaTwo.backgroundColor = [UIColor clearColor];
    self.downloadAreaTwo.layer.cornerRadius = 10.0;
    self.downloadAreaTwo.contentMode = UIViewContentModeScaleAspectFit;
    
    self.downloadAreaThree = [[[UIImageView alloc] init] autorelease];
    self.downloadAreaThree.backgroundColor = [UIColor clearColor];
    self.downloadAreaThree.layer.cornerRadius = 10.0;
    self.downloadAreaThree.contentMode = UIViewContentModeScaleAspectFit;
    
    int  cellHeight = self.view.bounds.size.width / 4;
    int  offset = self.view.bounds.size.width / 12;
    self.downloadAreaFour = [[[UIImageView alloc] initWithFrame:CGRectMake(self.view.bounds.size.width/2 - 3*cellHeight/2 - offset, self.view.bounds.size.height - cellHeight - offset, cellHeight, cellHeight)]autorelease];
    self.downloadAreaFive = [[[UIImageView alloc] initWithFrame:CGRectMake(self.view.bounds.size.width/2 - cellHeight/2, self.view.bounds.size.height - cellHeight - offset, cellHeight, cellHeight)] autorelease];
    self.downloadAreaSix = [[[UIImageView alloc] initWithFrame:CGRectMake(self.view.bounds.size.width/2 + cellHeight/2 + offset, self.view.bounds.size.height - cellHeight - offset, cellHeight, cellHeight)]autorelease];
    
    [self.view addSubview:self.downloadArea];
    self.downloadArea.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:self.downloadAreaTwo];
    self.downloadAreaTwo.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:self.downloadAreaThree];
    self.downloadAreaThree.translatesAutoresizingMaskIntoConstraints = NO;
    self.imageViewArray = [[[NSArray alloc] initWithObjects:self.downloadAreaFour, self.downloadAreaFive, self.downloadAreaSix, nil] autorelease];
    for (UIImageView* imageView in self.imageViewArray) {
        [self.view addSubview:imageView];
    }
    
    NSLayoutConstraint *leftImageViewConstraint = [NSLayoutConstraint constraintWithItem:self.downloadArea
                                                                               attribute:NSLayoutAttributeLeft
                                                                               relatedBy:NSLayoutRelationEqual
                                                                                  toItem:center
                                                                               attribute:NSLayoutAttributeLeft
                                                                              multiplier:1.0
                                                                                constant:-150.0];
    NSLayoutConstraint *topImageViewConstraint = [NSLayoutConstraint constraintWithItem:self.downloadArea
                                                                              attribute:NSLayoutAttributeTop
                                                                              relatedBy:NSLayoutRelationEqual
                                                                                 toItem:center
                                                                              attribute:NSLayoutAttributeTop
                                                                             multiplier:1.0
                                                                               constant:-200.0];
    NSLayoutConstraint *rightImageViewConstraint = [NSLayoutConstraint constraintWithItem:self.downloadArea
                                                                                attribute:NSLayoutAttributeRight
                                                                                relatedBy:NSLayoutRelationEqual
                                                                                   toItem:center
                                                                                attribute:NSLayoutAttributeRight
                                                                               multiplier:3.0
                                                                                 constant:0.0];
    NSLayoutConstraint *heightImageViewConstraint = [NSLayoutConstraint constraintWithItem:self.downloadArea
                                                                                 attribute:NSLayoutAttributeHeight
                                                                                 relatedBy:NSLayoutRelationEqual
                                                                                    toItem:nil
                                                                                 attribute:NSLayoutAttributeNotAnAttribute
                                                                                multiplier:1.0
                                                                                  constant:90.0];
    [self.view addConstraints:@[leftImageViewConstraint,
                                topImageViewConstraint,
                                rightImageViewConstraint,
                                heightImageViewConstraint]];
    
    NSLayoutConstraint *leftImageViewConstraint2 = [NSLayoutConstraint constraintWithItem:self.downloadAreaTwo
                                                                                attribute:NSLayoutAttributeLeft
                                                                                relatedBy:NSLayoutRelationEqual
                                                                                   toItem:center
                                                                                attribute:NSLayoutAttributeLeft
                                                                               multiplier:1.0
                                                                                 constant:-150.0];
    NSLayoutConstraint *topImageViewConstraint2 = [NSLayoutConstraint constraintWithItem:self.downloadAreaTwo
                                                                               attribute:NSLayoutAttributeTop
                                                                               relatedBy:NSLayoutRelationEqual
                                                                                  toItem:center
                                                                               attribute:NSLayoutAttributeTop
                                                                              multiplier:1.0
                                                                                constant:0.0];
    NSLayoutConstraint *rightImageViewConstraint2 = [NSLayoutConstraint constraintWithItem:self.downloadAreaTwo
                                                                                 attribute:NSLayoutAttributeRight
                                                                                 relatedBy:NSLayoutRelationEqual
                                                                                    toItem:center
                                                                                 attribute:NSLayoutAttributeRight
                                                                                multiplier:3.0
                                                                                  constant:-10.0];
    NSLayoutConstraint *heightImageViewConstrain2 = [NSLayoutConstraint constraintWithItem:self.downloadAreaTwo
                                                                                 attribute:NSLayoutAttributeHeight
                                                                                 relatedBy:NSLayoutRelationEqual
                                                                                    toItem:nil
                                                                                 attribute:NSLayoutAttributeNotAnAttribute
                                                                                multiplier:1.0
                                                                                  constant:90.0];
    [self.view addConstraints:@[leftImageViewConstraint2,
                                topImageViewConstraint2,
                                rightImageViewConstraint2,
                                heightImageViewConstrain2]];
    
    NSLayoutConstraint *leftImageViewConstraint3 = [NSLayoutConstraint constraintWithItem:self.downloadAreaThree
                                                                                attribute:NSLayoutAttributeLeft
                                                                                relatedBy:NSLayoutRelationEqual
                                                                                   toItem:center
                                                                                attribute:NSLayoutAttributeLeft
                                                                               multiplier:1.0
                                                                                 constant:-150.0];
    NSLayoutConstraint *topImageViewConstraint3 = [NSLayoutConstraint constraintWithItem:self.downloadAreaThree
                                                                               attribute:NSLayoutAttributeTop
                                                                               relatedBy:NSLayoutRelationEqual
                                                                                  toItem:center
                                                                               attribute:NSLayoutAttributeTop
                                                                              multiplier:1.0
                                                                                constant:-100.0];
    NSLayoutConstraint *rightImageViewConstraint3 = [NSLayoutConstraint constraintWithItem:self.downloadAreaThree
                                                                                 attribute:NSLayoutAttributeRight
                                                                                 relatedBy:NSLayoutRelationEqual
                                                                                    toItem:center
                                                                                 attribute:NSLayoutAttributeRight
                                                                                multiplier:3.0
                                                                                  constant:0.0];
    NSLayoutConstraint *heightImageViewConstrain3 = [NSLayoutConstraint constraintWithItem:self.downloadAreaThree
                                                                                 attribute:NSLayoutAttributeHeight
                                                                                 relatedBy:NSLayoutRelationEqual
                                                                                    toItem:nil
                                                                                 attribute:NSLayoutAttributeNotAnAttribute
                                                                                multiplier:1.0
                                                                                  constant:90.0];
    [self.view addConstraints:@[leftImageViewConstraint3,
                                topImageViewConstraint3,
                                rightImageViewConstraint3,
                                heightImageViewConstrain3]];
    
    [pool release];
}

- (void)startDownload {
    
    NSArray *downloadArea = [self.downloadArea subviews];
    for (UIView *delete in downloadArea) {
        [delete removeFromSuperview];
    }
    NSArray *downloadAreaTwo = [self.downloadAreaTwo subviews];
    for (UIView *delete in downloadAreaTwo) {
        [delete removeFromSuperview];
    }
    NSArray *downloadAreaThree = [self.downloadAreaThree subviews];
    for (UIView *delete in downloadAreaThree) {
        [delete removeFromSuperview];
    }
    for (UIImageView *imageView in self.imageViewArray) {
        imageView.image = nil;
    }
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSURL *imageUrl = [NSURL URLWithString:@"https://s.dou.ua/img/announces/epam-university-840_EvEN7E8.png"];
        NSData *imageDate = [NSData dataWithContentsOfURL:imageUrl];
        UIImage *image = [UIImage imageWithData:imageDate];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            UIImageView *imageHolder = [[[UIImageView alloc] initWithFrame:CGRectMake(-10, 0, 160, 95)] autorelease];
            imageHolder.image = image;
            [self.downloadArea addSubview:imageHolder];
            UILabel *titleLabel = [[[UILabel alloc] initWithFrame:CGRectMake(140, 40, 250, 20)] autorelease];
            NSString *labelText = imageUrl.absoluteString;
            titleLabel.translatesAutoresizingMaskIntoConstraints = YES;
            titleLabel.attributedText = [[[NSAttributedString alloc] initWithString:labelText attributes:@{ NSStrokeColorAttributeName : [UIColor blackColor], NSForegroundColorAttributeName : [UIColor blackColor], NSStrokeWidthAttributeName : @-3.5 }] autorelease];
            [titleLabel setFont:[UIFont fontWithName:@"Helvetica" size:15]];
            [self.downloadArea addSubview:titleLabel];
            
        });
    });
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSURL *imageUrl = [NSURL URLWithString:@"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ5J4dDpaYdsDcNdQIltnPkCevKlkt0PCYi2cLb7ZUKGRIXjmaI_w"];
        NSData *imageDate = [NSData dataWithContentsOfURL:imageUrl];
        UIImage *image = [UIImage imageWithData:imageDate];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            UIImageView *imageHolder = [[[UIImageView alloc] initWithFrame:CGRectMake(20, 0, 100, 100)] autorelease];
            imageHolder.image = image;
            [self.downloadAreaTwo addSubview:imageHolder];
            UILabel *titleLabel = [[[UILabel alloc] initWithFrame:CGRectMake(140, 40, 250, 20)] autorelease];
            NSString *labelText = imageUrl.absoluteString;
            titleLabel.translatesAutoresizingMaskIntoConstraints = YES;
            titleLabel.attributedText = [[[NSAttributedString alloc] initWithString:labelText attributes:@{ NSStrokeColorAttributeName : [UIColor blackColor], NSForegroundColorAttributeName : [UIColor blackColor], NSStrokeWidthAttributeName : @-3.5 }] autorelease];
            [titleLabel setFont:[UIFont fontWithName:@"Helvetica" size:15]];
            [self.downloadAreaTwo addSubview:titleLabel];
        });
    });
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSURL *imageUrl = [NSURL URLWithString:@"https://i.io.ua/img_su/large/0237/56/02375685_n1.jpg"];
        NSData *imageDate = [NSData dataWithContentsOfURL:imageUrl];
        UIImage *image = [UIImage imageWithData:imageDate];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            UIImageView *imageHolder = [[[UIImageView alloc] initWithFrame:CGRectMake(20, 0, 95, 95)] autorelease];
            imageHolder.image = image;
            [self.downloadAreaThree addSubview:imageHolder];
            UILabel *titleLabel = [[[UILabel alloc] initWithFrame:CGRectMake(140, 40, 250, 20)] autorelease];
            NSString *labelText = imageUrl.absoluteString;
            titleLabel.translatesAutoresizingMaskIntoConstraints = YES;
            titleLabel.attributedText = [[[NSAttributedString alloc] initWithString:labelText attributes:@{ NSStrokeColorAttributeName : [UIColor blackColor], NSForegroundColorAttributeName : [UIColor blackColor], NSStrokeWidthAttributeName : @-3.5 }] autorelease];
            [titleLabel setFont:[UIFont fontWithName:@"Helvetica" size:15]];
            [self.downloadAreaThree addSubview:titleLabel];
        });
    });
    
    NSMutableArray<UIImage*> *images = [NSMutableArray array];
    
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_group_t group = dispatch_group_create();
    
    dispatch_group_async(group, queue, ^{
        NSURL *imageUrl4 = [NSURL URLWithString:@"https://s-media-cache-ak0.pinimg.com/originals/4c/11/21/4c11216b99410510dacdf8c68b4e12fd.jpg"];
        NSData *imageDate4 = [NSData dataWithContentsOfURL:imageUrl4];
        
        if (imageDate4 != nil) {
            [images addObject:[UIImage imageWithData:imageDate4]];
        } else {
            dispatch_async(dispatch_get_main_queue(), ^{
                [self presentAlertControllerWithTitle:@"Error" andMessage:@"Check your connection"];
            });
        }
    });
    
    dispatch_group_async(group, queue, ^{
        NSURL *imageUrl5 = [NSURL URLWithString:@"https://i.pinimg.com/originals/21/48/a7/2148a73c93ca24057e10d7d66c3aa1b9.jpg"];
        NSData *imageDate5 = [NSData dataWithContentsOfURL:imageUrl5];
        
        if (imageDate5 != nil) {
            [images addObject:[UIImage imageWithData:imageDate5]];
        } else {
            dispatch_async(dispatch_get_main_queue(), ^{
                [self presentAlertControllerWithTitle:@"Error" andMessage:@"Check your connection"];
            });
        }
    });
    
    dispatch_group_async(group, queue, ^{
        NSURL *imageUrl6 = [NSURL URLWithString:@"https://i.pinimg.com/originals/6a/11/a8/6a11a884abbe469d87a797ced5d1b7cc.jpg"];
        NSData *imageDate6 = [NSData dataWithContentsOfURL:imageUrl6];
        
        if (imageDate6 != nil) {
            [images addObject:[UIImage imageWithData:imageDate6]];
        } else {
            dispatch_async(dispatch_get_main_queue(), ^{
                [self presentAlertControllerWithTitle:@"Error" andMessage:@"Check your connection"];
            });
        }
        
    });
    
    dispatch_group_notify(group, dispatch_get_main_queue(), ^{
        [images enumerateObjectsUsingBlock:^(UIImage * _Nonnull image, NSUInteger idx, BOOL * _Nonnull stop) {
            self.imageViewArray[idx].image = image;
        }];
    });
    dispatch_release(group);
}

- (void) refresh:(id)sender {
    
    NSArray *downloadArea = [self.downloadArea subviews];
    for (UIView *delete in downloadArea) {
        [delete removeFromSuperview];
    }
    NSArray *downloadAreaTwo = [self.downloadAreaTwo subviews];
    for (UIView *delete in downloadAreaTwo) {
        [delete removeFromSuperview];
    }
    NSArray *downloadAreaThree = [self.downloadAreaThree subviews];
    for (UIView *delete in downloadAreaThree) {
        [delete removeFromSuperview];
    }
    for (UIImageView *imageView in self.imageViewArray) {
        imageView.image = nil;
    }
    
}
- (void)presentAlertControllerWithTitle: (NSString*) title andMessage: (NSString*) message {
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
    [alertController addAction:defaultAction];
    [self presentViewController:alertController animated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
- (void)dealloc
{
    [_images release];
    [_imageViewArray release];
    [super dealloc];
}

@end

