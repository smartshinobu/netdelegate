//
//  ViewController.m
//  netdelegate
//
//  Created by ビザンコムマック０７ on 2014/11/09.
//  Copyright (c) 2014年 mycompany. All rights reserved.
//

#import "ViewController.h"
#import "Netstatus.h"

@interface ViewController ()<NetstatusDelegate>{
    //Netstatusの変数
    Netstatus *nesta;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    //引数を自分自身としてnestaを初期化(これによりnestaのデリゲートは自分自身となる)
    nesta = [[Netstatus alloc]initWithdelegate:self];
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//デリゲートメソッドを実装
-(void)Netnotlink{
    self.label.text = @"ネットと接続できません";
}
-(void)Netlink{
    self.label.text = @"ネットと接続できます";
}

@end
