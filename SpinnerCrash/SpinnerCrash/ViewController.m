//
//  ViewController.m
//  SpinnerCrash
//
//  Created by Eugenie Tyan on 5/17/19.
//  Copyright © 2019 Eugenie Tyan. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () {
    UIActivityIndicatorView *spinner;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    spinner = [[UIActivityIndicatorView alloc]
               initWithActivityIndicatorStyle: UIActivityIndicatorViewStyleGray];
    CGFloat centerX = self.view.bounds.size.width/2;
    CGFloat centerY = self.view.bounds.size.height/2;
    spinner.center = CGPointMake(centerX, centerY);
    [self.view addSubview: spinner];
    // Do any additional setup after loading the view.
}

- (IBAction)buttonStartPressed:(id)sender {
    [spinner startAnimating];
}

- (IBAction)buttonStopPressed:(id)sender {
    [spinner stopAnimating];
}

- (IBAction)buttonCrashPressed:(id)sender {
    dispatch_sync(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        dispatch_sync(dispatch_get_main_queue(), ^{
            NSLog(@"Crash?");
        });
    });

}

@end
