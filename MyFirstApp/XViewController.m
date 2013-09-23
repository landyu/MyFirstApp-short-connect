//
//  XViewController.m
//  MyFirstApp
//
//  Created by mac on 8/16/13.
//  Copyright (c) 2013 landyu. All rights reserved.
//

#import "XViewController.h"
#import "XSocket.h"

@interface XViewController ()

@end

@implementation XViewController
@synthesize lblLightValue;
@synthesize socket;

NSString *ghost ;
NSString *gport;
//@synthesize host;
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    _lblInfo.text = @"FUXK U";
    lblLightValue.text = @"0";
    
    //ghost = [[[NSString alloc] initWithString:@"192.168.18.10"] autorelease];
    //gport = [[[NSString alloc] initWithString:@"80"] autorelease];
    //_lblInfo.textColor = [UIColor greenColor];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    [_lblInfo release];
    [lblLightValue release];
    [super dealloc];
}
- (IBAction)pressButton:(UIButton *)sender
{
   
    NSString *title = [sender titleForState:UIControlStateNormal];
    
    
    
    if ([title isEqualToString:@"Connect"])
    {
//        if (socket == nil)
//        {
//            NSLog(@"host : %@:%@", ghost, gport);
//            socket = [[GCDAsyncSocket alloc]initWithDelegate:self delegateQueue:dispatch_get_main_queue()];
//            //socket.delegate = self;
//            NSError *err = nil;
//            if(![socket connectToHost:ghost onPort:[gport intValue] error:&err])
//            {
//                //[self addText:err.description];
//                NSLog(@"%@", err.description);
//            }
//            else
//            {
//                NSLog(@"ok");
//                //[self addText:@"打开端口"];
//            }
//            _lblInfo.text = @"Connect";
//
//        }
//        else
//        {
//            //NSLog(@"socket existing");
//        }
    }
    else
    {
//        if (socket != nil)
//        {
//            
//            [socket setDelegate:nil delegateQueue:NULL];
//            [socket disconnectAfterReadingAndWriting];
//            [socket release];
//            socket = nil;
//            _lblInfo.text = @"Disconnect";
//            NSLog(@"Disconnect");
//        }
        
    }
//    NSString *s = [[[NSString alloc] initWithFormat:@"you press %@ button", title] autorelease];
//    
//    _lblInfo.text = s;
//    [s release];
}

NSString *son = @"ON";
NSString *soff =@"OFF";
- (IBAction)playOrStop:(UISwitch *)sender {
    
    NSData* rsp_data = [[[NSData alloc] init] autorelease];//
    if (sender.on)
    {
        NSData* req_data =[[[NSData alloc]initWithData:[@"ON" dataUsingEncoding:NSUTF8StringEncoding]]autorelease];
        [XSocket call:@"192.168.18.207:54321" request:req_data response:&rsp_data];
    }
    else
    {
         NSData* req_data =[[[NSData alloc]initWithData:[@"OFF" dataUsingEncoding:NSUTF8StringEncoding]] autorelease];
        [XSocket call:@"192.168.18.207:54321" request:req_data response:&rsp_data];
    }
    
    //[rsp_data release];
    
    //NSLog(@"rsp_data ->str :%@", [[[NSString alloc]initWithBytes:[rsp_data bytes] length:[rsp_data length] encoding:NSUTF8StringEncoding]autorelease]);
}

- (IBAction)lightValue:(id)sender {
    UISlider *slider = (UISlider *)sender;
    int progressAsInt = (int)roundf(slider.value);
    NSString *lV =  [NSString stringWithFormat:@"%d", progressAsInt];
    
    NSData* rsp_data = [[[NSData alloc] init] autorelease];
    [XSocket call:@"192.168.18.207:54321" request:[lV dataUsingEncoding:NSUTF8StringEncoding]  response:&rsp_data];

    lblLightValue.text = lV;
}



//- (void)socket:(GCDAsyncSocket *)sock willDisconnectWithError:(NSError *)err
//{
//    NSLog(@"onSocket:%p willDisconnectWithError:%@", sock, err);
//}
//- (void)socketDidDisconnect:(GCDAsyncSocket *)sock
//{
//    //断开连接了
//    NSLog(@"onSocketDidDisconnect:%p", sock);
//}






@end















