//
//  XViewController.h
//  MyFirstApp
//
//  Created by mac on 8/16/13.
//  Copyright (c) 2013 landyu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GCDAsyncSocket.h"

@interface XViewController : UIViewController<GCDAsyncSocketDelegate,UITextFieldDelegate>
{
    
    IBOutlet UILabel *_lblInfo;
    GCDAsyncSocket *socket;
}

@property(strong)  GCDAsyncSocket *socket;
- (IBAction)pressButton:(UIButton *)sender;
- (IBAction)playOrStop:(UISwitch *)sender;
- (IBAction)lightValue:(id)sender;
@property (retain, nonatomic) IBOutlet UILabel *lblLightValue;
@end
