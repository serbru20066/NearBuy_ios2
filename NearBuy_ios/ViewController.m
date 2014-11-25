//
//  ViewController.m
//  NearBuy_ios
//
//  Created by bruno on 19/11/14.
//  Copyright (c) 2014 bruno. All rights reserved.
//

#import "ViewController.h"
#import "FeSpinnerTenDot.h"
#import "UIColor+flat.h"
#import "Lista_Controller.h"


@interface ViewController ()<FeSpinnerTenDotDelegate>
{
    NSInteger index;
}
@property (strong, nonatomic) FeSpinnerTenDot *spinner;
@property (strong, nonatomic) NSArray *arrTitile;
@property (strong, nonatomic) NSTimer *timer;

- (IBAction)start:(id)sender;
- (IBAction)dismiss:(id)sender;
-(void) changeTitle;
-(void) longTask;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self.navigationController.navigationBar setHidden:YES];
    //Spinner
    //*********
    index = 0;
    _arrTitile = @[@"CARGANDO",@"ESPERE",@"PORFAVOR",@"EXITO"];
    
    // init Loader
    _spinner = [[FeSpinnerTenDot alloc] initWithView:self.view withBlur:YES];
    _spinner.titleLabelText = _arrTitile[index];
    _spinner.fontTitleLabel = [UIFont fontWithName:@"Neou-Thin" size:36];
    
    _spinner.delegate = self;
    
    //Recognizer
    
    UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTapFrom:)];
    tapGestureRecognizer.delegate=self;
    
    [self.view addGestureRecognizer:tapGestureRecognizer];

    
}
- (void) handleTapFrom: (UITapGestureRecognizer *)recognizer
{
    [_txtUsuario resignFirstResponder];
    [_txtContrasena resignFirstResponder];
   
}
- (IBAction)dismiss:(id)sender
{
    [_timer invalidate];
    [_spinner dismiss];
    
    // pop
    [self.navigationController popViewControllerAnimated:YES];
}
-(void) longTask
{
    // Do a long take
    sleep(5);
}
-(void) changeTitle
{
    NSLog(@"index = %d",index);
    
    if (index >= _arrTitile.count)
        return;
    
    _spinner.titleLabelText = _arrTitile[index];
    index++;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)OnCLick_IniciarSesion:(id)sender {
    
    [self.view addSubview:_spinner];

    
    
    if (!_timer)
    {
        _timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(changeTitle) userInfo:nil repeats:YES];
    }
    
    [_spinner showWhileExecutingSelector:@selector(longTask) onTarget:self withObject:nil completion:^{
        [_timer invalidate];
        _timer = nil;
        
        index = 0;
        
        //[self.navigationController popToRootViewControllerAnimated:YES];
        
        Lista_Controller *ListaVC =[[Lista_Controller alloc] init];
        
        [self.navigationController pushViewController:ListaVC animated:YES];
        
        
        
    }];
    
}
@end
