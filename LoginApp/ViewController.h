//
//  ViewController.h
//  LoginApp
//
//  Created by Steve Calabro on 7/29/13.
//  Copyright (c) 2013
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *txt_username;
@property (weak, nonatomic) IBOutlet UITextField *txt_password;

- (IBAction)loginBtn:(id)sender;

@end
