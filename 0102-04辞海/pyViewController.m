//
//  pyViewController.m
//  0102-04辞海
//
//  Created by panyong on 14-1-2.
//  Copyright (c) 2014年 panyong. All rights reserved.
//

#import "pyViewController.h"
#define KBaseURL     @"http://dict.cn/"
@interface pyViewController ()<UITextFieldDelegate>

@end

@implementation pyViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    //这里是设置
    
    
}



-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    if (textField.text.length > 0) {
        [self getHTML:textField.text];
    }
    return YES;
}


-(void)getHTML:(NSString *)string
{
    //设置url
    NSString *url = [NSString stringWithFormat:@"%@%@",KBaseURL,string];
    //设置urlrequest
    NSURLRequest *urlRequest = [NSURLRequest requestWithURL:url cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:5.0f];
    //发送亲求
    [NSURLConnection sendAsynchronousRequest:urlRequest queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
       //这里得到了请求
        NSLog(@"%@",data);
    }];


}




@end
