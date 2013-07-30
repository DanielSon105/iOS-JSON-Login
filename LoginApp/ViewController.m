//
//  ViewController.m
//  LoginApp
//
//  Created by Steve Calabro on 7/29/13.
//  Copyright (c) 2013
//

#import "ViewController.h"
#import <CommonCrypto/CommonDigest.h>
#import "NSString+MD5.h"

@interface ViewController ()

@end

@implementation ViewController

NSString *salt = @"YOURSALT";

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) alertStatus:(NSString *)msg :(NSString *)title
{
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:title
                                                        message:msg
                                                       delegate:self
                                              cancelButtonTitle:@"Ok"
                                              otherButtonTitles:nil, nil];
    
    [alertView show];
}
- (IBAction)loginBtn:(id)sender
{
    int user_id = NULL;
    NSString *username = NULL;
    NSString *password = NULL;
    bool logged = false;
    
    NSString *test_username = _txt_username.text;
    NSString *test_password = _txt_password.text;
    
    NSString *salttest_password = [NSString stringWithFormat:@"%@%@", salt, test_password];
        
    test_password = [salttest_password MD5];
    
    NSError *error = nil;
    NSString *url = [NSString stringWithFormat: @"http://YOURSERVERURL/login.php?username=%@&password=%@", test_username, test_password];

    NSData *jsonData = [NSData dataWithContentsOfURL:[NSURL URLWithString:url]];
    
    if((![test_username isEqualToString: @""]) && (![_txt_password.text isEqualToString: @""]))
    {
        if (jsonData)
        {
            
            id jsonObjects = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&error];
            
            if (error) {
                NSLog(@"error is %@", [error localizedDescription]);
                 
                // Handle Error and return
                return;
                
            }
            
            NSArray *keys = [jsonObjects allKeys];
            
            // values in foreach loop
            for (NSString *key in keys)
            {
                if([key isEqual: @"id"])
                {
                    NSString *userid_String;
                    userid_String = [jsonObjects objectForKey:@"id"];
                    user_id = [userid_String intValue];
                }
                else if([key isEqual: @"username"])
                {
                    username = [jsonObjects objectForKey:key];
                }
                else if([key isEqual: @"password"])
                {
                    password = [jsonObjects objectForKey:key];
                }
                else if([key isEqual: @"logged"])
                {
                    logged = [jsonObjects objectForKey:key];
                }
                //NSLog(@"%@ is %@",key, [jsonObjects objectForKey:key]);
               
            }
            if(user_id > 0 && logged)
            {
                NSLog(@"Success you are logged in");
            }
            else
            {
                // Handle Error
                NSLog(@"Fail you are NOT logged in");
            }

        }
        else
        {
            // Handle Error
            NSLog(@"Fail you are NOT logged in");
        }
    }
    else
    {
        // Handle Error
        NSLog(@"Fail you are NOT logged in");
    }

}
@end
