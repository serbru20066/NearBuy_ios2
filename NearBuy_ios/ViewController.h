//
//  ViewController.h
//  NearBuy_ios
//
//  Created by bruno on 19/11/14.
//  Copyright (c) 2014 bruno. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UIGestureRecognizerDelegate>
@property (weak, nonatomic) IBOutlet UITextField *txtUsuario;
@property (weak, nonatomic) IBOutlet UITextField *txtContrasena;


- (IBAction)OnCLick_IniciarSesion:(id)sender;

@end

