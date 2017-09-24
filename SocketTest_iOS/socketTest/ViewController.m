//
//  ViewController.m
//  socketTest
//
//  Created by zaiwei on 2017/9/6.
//  Copyright © 2017年 home. All rights reserved.
//

#import "ViewController.h"
#import <sys/socket.h>
#import <netinet/in.h>
#import <arpa/inet.h>
#import <unistd.h>

#import "GCDAsyncSocket.h"
#import "AsyncNetwork.h"
#import "Chat.pb.h"
#import "Login.pb.h"
@interface ViewController ()<GCDAsyncSocketDelegate>
@property (weak, nonatomic) IBOutlet UILabel *showTV;
@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (nonatomic, strong) GCDAsyncSocket *ay;

@property (retain) AsyncServer *server; // the server

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self initGCDScoket];
   
}

-(void)sendBuffA{
    CPrivateChat_Builder *builder = [CPrivateChat builder];
    [builder setDest:@"123"];
    [builder setContentType:ContentTypeContent];
    [builder setContent:@"rrrr"];
//    [builder setGroupId:idStr];
    [builder setChatType:ChatTypePoint];
    [builder setSelf:@"456"];
    [builder setContentTime:@"1970-12-12 10:10:10"];
    CPrivateChat *chat = [builder build];
    //    NSData *ddd = [@"rtyy" dataUsingEncoding:NSUTF8StringEncoding];
    [self.ay writeData:[chat data] withTimeout:-1 tag:-100];
    [self.ay readDataWithTimeout:-1 tag:-100];

}
-(void)sendBuffB{
    CLogin_Builder * builder = [CLogin builder];
    [builder setUserid:@"456"];
    [builder setPasswd:@"123"];
    [builder setType:TypeAndroid];
    
    NSData *data = [[builder build] data];
    NSLog(@"%ld",data.length);
    NSError * error ;
    
    
    //        NSData *ddd = [@"--login" dataUsingEncoding:NSUTF8StringEncoding];
    [self.ay writeData:data withTimeout:-1 tag:0];
    [self.ay readDataWithTimeout:-1 tag:0];

}

- (IBAction)bttonClick:(id)sender {
//    [self sendGCDSocket];
    [self sendBuffB];

}




-(void)sendGCDSocket{
    if (self.textField.text.length != 0) {
        
        self.showTV.text = [NSString stringWithFormat:@"%@\n客户端说:%@",self.showTV.text,self.textField.text];
        
        [self.ay writeData:[self.textField.text dataUsingEncoding:NSUTF8StringEncoding]
               withTimeout:-1
                       tag:101];
        
        [self.ay readDataWithTimeout:-1 tag:101];
        
        self.textField.text = nil;
    }
}
-(void)initGCDScoket{
    self.ay = [[GCDAsyncSocket alloc] initWithDelegate:self delegateQueue:dispatch_get_main_queue()];
    self.ay.delegate = self;
    
    NSError *error;
    BOOL connnetFinsh = [self.ay connectToHost:@"localhost" onPort:8989 error:&error];
    
    if (!connnetFinsh) {
        NSLog(@"connectError: %@", error);
    }
    
    NSString *msg = @"HelloNetty";
    [self.ay writeData:[msg dataUsingEncoding:NSUTF8StringEncoding]
           withTimeout:10.0f
                   tag:101];
    
    [self.ay readDataWithTimeout:-1 tag:0];
}
#pragma mark - <GCDAsyncSocketDelegate>
- (void)socket:(GCDAsyncSocket *)sock didReadData:(NSData *)data withTag:(long)tag{
    NSString *msg = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    NSLog(@"msg-----%@",msg);
    
    if (self.showTV.text.length == 0)
    {
        self.showTV.text = [NSString stringWithFormat:@"服务器说:%@",msg];
    }
    else
    {
        self.showTV.text = [NSString stringWithFormat:@"%@\n服务器说:%@",self.showTV.text,msg];
    }
    
    [self.ay readDataWithTimeout:-1 tag:0];
    
    
}
- (void)socket:(GCDAsyncSocket *)sock didWriteDataWithTag:(long)tag{
    NSLog(@"");
}
- (void)socket:(GCDAsyncSocket *)sock didConnectToHost:(NSString *)host port:(uint16_t)port{
    NSLog(@"didConnectToHost    %@------%d",host,port);

}
- (void)socket:(GCDAsyncSocket *)sock didReadPartialDataOfLength:(NSUInteger)partialLength tag:(long)tag{
    NSLog(@"Received bytes: %lu",(unsigned long)partialLength);
}

- (void)socket:(GCDAsyncSocket *)sock didAcceptNewSocket:(GCDAsyncSocket *)newSocket{
    NSLog(@"");
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


//-(void)sendNetwork{
//    // ask the server to send the input string to all connected clients
//    NSString *ttt = [NSString stringWithFormat:@"%@\n客户端说:%@",self.showTV.text,self.textField.text];
//    [self.server sendObject:ttt];
//
//
//}
//-(void)initNetwork{
//    // create and configure the server
//    self.server = [AsyncServer new];
//    self.server.serviceType = AsyncNetworkDefaultServiceType;
//    self.server.serviceName = @"localhost";
//    self.server.port = 9090;
//    self.server.delegate = self;
//    
//    // start the server
//    [self.server start];
//    
//
//}
//
//#pragma mark AsyncServerDelegate
//
//- (void)server:(AsyncServer *)theServer didConnect:(AsyncConnection *)connection;
//{
//    // display log entry
//    NSString *string = [NSString stringWithFormat:@"[%@ connected]\n", connection.host];
//    NSLog(@"%@",string);
//    
//}
//
//- (void)server:(AsyncServer *)theServer didDisconnect:(AsyncConnection *)connection;
//{
//    // display log entry
//    NSString *string = [NSString stringWithFormat:@"[%@ disconnected]\n", connection.host];
//NSLog(@"%@",string);
//}
//
//- (void)server:(AsyncServer *)theServer didReceiveCommand:(AsyncCommand)command object:(id)object connection:(AsyncConnection *)connection;
//{
//    // display log entry
//    NSString *string = [NSString stringWithFormat:@"<< [%@] %@\n", connection.host, object];
//NSLog(@"%@",string);
//}
//
//- (void)server:(AsyncServer *)theServer didFailWithError:(NSError *)error;
//{
//    NSLog(@"%@",[NSString stringWithFormat:@"[error] %@\n", error.localizedDescription]);
//}
//
//

@end
