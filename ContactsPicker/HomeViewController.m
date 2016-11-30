//
//  HomeViewController.m
//  ContactsPicker
//
//  Created by Dipankar on 11/15/16.
//  Copyright © 2016 ABCoder. All rights reserved.
//

#import "HomeViewController.h"
#import "ContactPickerView.h"

@interface HomeViewController ()

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (IBAction)tapContactBtn:(id)sender {
    ContactPickerView* infoController = [self.storyboard instantiateViewControllerWithIdentifier:@"ContactPickerView"];
    infoController.delegate = self;
    infoController.isMessage = YES;
    
    UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:infoController];
    
    navController.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
    [self presentViewController:navController animated:YES completion:nil];
}

- (IBAction)tapEmailBtn:(id)sender {
    ContactPickerView* infoController = [self.storyboard instantiateViewControllerWithIdentifier:@"ContactPickerView"];
    infoController.delegate = self;
    infoController.isMessage = NO;
    
    UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:infoController];
    
    navController.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
    [self presentViewController:navController animated:YES completion:nil];
}

-(void)ContactPickerControllerDidFinish:(NSArray *)contacts {
    NSLog(@"delegate contacts: %@", contacts);
}
-(void)ContactPickerControllerDidCancel:(BOOL)picker {
    NSLog(@"delegate contacts cancel");
    [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
    
}

@end
