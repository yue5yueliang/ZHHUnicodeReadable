//
//  ZHHViewController.m
//  ZHHUnicodeReadable
//
//  Created by 桃色三岁 on 10/13/2022.
//  Copyright (c) 2022 桃色三岁. All rights reserved.
//

#import "ZHHViewController.h"

@interface ZHHViewController ()

@end

@implementation ZHHViewController

- (void)viewDidLoad {
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    NSString *path = [[NSBundle mainBundle] pathForResource:@"teleplayList" ofType:@"json"];
    NSData *jsonData = [NSData dataWithContentsOfFile:path options:NSDataReadingMappedIfSafe error:nil];
    NSDictionary *json = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:nil];
    NSLog(@"---------json--------\n%@",json);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
