//
//  Netstatus.m
//  netdelegate
//
//  Created by ビザンコムマック０７ on 2014/11/09.
//  Copyright (c) 2014年 mycompany. All rights reserved.
//

#import "Netstatus.h"

@implementation Netstatus{
    //Reachablityの変数宣言
    Reachability *ability;
}

@synthesize delegate;

//引数をデリゲートとするためのイニシャライザ
-(id)initWithdelegate:(id)setdelegate{
    if(self = [super init]){
        //自分自身の初期化処理
        
        //ablityの初期化(メソッドreachabilityForInternetConnectionはネット接続を確認するための値を返す)
        ability = [Reachability reachabilityForInternetConnection];
        //引数setdelegateをこのクラスのデリゲートとする
        self.delegate = setdelegate;
        [self statuschange];
        //ネットの接続状況が変わるたびにメソッドstatuschangeを呼び出すように設定
        [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(statuschange) name:kReachabilityChangedNotification object:nil];
        //ネットワーク監視開始
        [ability startNotifier];
    }
    return self;
}


//ネットの接続状況が変わるたびに呼ばれるメソッド
-(void)statuschange{
    //ネットの接続情報を持つ変数を生成
    //クラスNetworkStatusは、ネットの接続情報を持つためのクラス
    //メソッドcurrentReachabilityStatusは、現在のネットの接続情報を返す
    NetworkStatus status = [ability currentReachabilityStatus];
    //statusの値がNotReacableでないかどうか(ネットと接続できる状況であるか)
    if (status != NotReachable) {
        //デリゲート先にNetlinkというメソッドがあるかどうか
        if ([self.delegate respondsToSelector:@selector(Netlink)]) {
            //デリゲート先のNetlinkを実行
            [self.delegate Netlink];
        }
    }
    //ネットと接続できない場合の処理
    else{
        //デリゲート先にNetnotlinkというメソッドがあるかどうか
        if ([self.delegate respondsToSelector:@selector(Netnotlink)]) {
            //デリゲート先のNetnotlinkを実行
            [self.delegate Netnotlink];
        }
    }
}

@end
