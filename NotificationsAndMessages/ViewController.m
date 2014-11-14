//
//  ViewController.m
//  NotificationsAndMessages
//
//  Created by Jaime Hernandez on 11/14/14.
//  Copyright (c) 2014 Jaime Hernandez. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (strong, nonatomic) IBOutlet UIButton *notifyButtonPressed;
@property (strong, nonatomic) IBOutlet UIView *notifyLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(TouchedMyButton:)
                                                 name:@"TouchedMyButton"
                                               object:nil];

    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(ChangedLabelChangeButton:)
                                                 name:@"ChangedLabelChangeButton"
                                               object:nil];


}
- (IBAction)onNotifyButtonPressed:(id)sender
{
    [[NSNotificationCenter defaultCenter] postNotificationName:@"TouchedMyButton" object:nil];
}

-(void)TouchedMyButton:(NSNotification *)button
{
    self.notifyLabel.backgroundColor = [UIColor purpleColor];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"ChangedLabelChangeButton" object:nil];
}

-(void)ChangedLabelChangeButton:(NSNotification *)label
{
    self.notifyButtonPressed.backgroundColor = [UIColor purpleColor];
    [self.notifyButtonPressed setTintColor:[UIColor lightGrayColor]];    // titleLabel.textColor = [UIColor lightGrayColor];
}
@end
