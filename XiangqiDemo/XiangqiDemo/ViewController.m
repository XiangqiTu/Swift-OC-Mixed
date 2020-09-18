//
//  ViewController.m
//  XiangqiDemo
//
//  Created by kk on 2020/8/18.
//  Copyright © 2020 Xiangqi. All rights reserved.
//

#import "ViewController.h"

//App-Target 中，Pod访问方式

    //开启了:modular_headers => true 只能ModuleName方式访问
    #import <MixedModule/MixedModule-Swift.h>
    #import <MixedModule/HomeViewController.h>

    //未开启:modular_headers => false OCModule两者皆可以
    #import "OCViewController.h"
    #import <OCModule/OCViewController.h>

    //SwiftModule 在App-Target中只能是ModuleName方式访问
    #import <SwiftModule/SwiftModule-Swift.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}


@end
