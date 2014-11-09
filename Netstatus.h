//
//  Netstatus.h
//  netdelegate
//
//  Created by ビザンコムマック０７ on 2014/11/09.
//  Copyright (c) 2014年 mycompany. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Reachability.h"

//プロトコルを宣言
@protocol NetstatusDelegate <NSObject>
//デリゲートメソッドの宣言
//ネットが接続できない状態になったときよばれるメソッド
-(void)Netnotlink;
//ネットが接続できる状態になったときによばれるメソッド
-(void)Netlink;
@end

@interface Netstatus : NSObject
//引数をデリゲートとするためのイニシャライザ
-(id)initWithdelegate:(id)setdelegate;
//デリゲート先で参照できるようにするためプロパティを定義
@property (nonatomic,assign) id<NetstatusDelegate> delegate;
@end
