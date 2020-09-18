//
//  HomeViewController.m
//  Pods
//
//  Created by kk on 2020/8/28.
//

#import "HomeViewController.h"

//可以直接访问内部build后的 moduleName-Swift.h文件
#import "MixedModule-Swift.h"

@interface HomeViewController ()

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    MixHomeSwift *mixHomeSwift = [MixHomeSwift new];
    [mixHomeSwift mixHome];
}

- (void)logHomeViewController {
    
}


@end
