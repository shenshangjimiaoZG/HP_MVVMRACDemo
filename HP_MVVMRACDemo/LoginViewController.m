#import "LoginViewController.h"
#import <Masonry/Masonry.h>
#import "LoginViewModel.h"


@interface LoginViewController ()
@property (weak, nonatomic) IBOutlet UITextField *txtUserName;
@property (weak, nonatomic) IBOutlet UITextField *txtPassword;
@property (weak, nonatomic) IBOutlet UIButton *btnLogin;
@property (weak, nonatomic) IBOutlet UIView *subView;

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.subView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.center.equalTo(self.view);
        make.size.mas_equalTo(CGSizeMake(300, 300));
    }];
    [self.txtUserName mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerX.equalTo(self.subView);
        make.top.equalTo(self.subView.mas_top).offset(50);
        make.size.mas_equalTo(CGSizeMake(120, 40));
        make.bottom.equalTo(self.txtPassword.mas_top).offset(-15);
        
    }];
    [self.txtPassword mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.txtUserName.mas_bottom).offset(15);
        make.left.right.equalTo(self.txtUserName);
        make.size.equalTo(self.txtUserName);
        make.bottom.equalTo(self.btnLogin.mas_top).offset(-20);
    }];
    [self.btnLogin mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerX.equalTo(self.subView);
        make.top.equalTo(self.txtPassword.mas_bottom).offset(20);
        make.size.mas_equalTo(CGSizeMake(150, 50));
    }];
    
    LoginViewModel *m=[[LoginViewModel alloc]init];
    
    [[[self.btnLogin rac_signalForControlEvents:UIControlEventTouchUpInside]flattenMap:^id _Nullable(__kindof UIControl * _Nullable value) {
       
        return [m valid:self.txtUserName.text withPwd:self.txtPassword.text];
        
    }]subscribeNext:^(id  _Nullable x) {
        
        UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"提示"
                                                                       message:x
                                                                preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                                                              handler:^(UIAlertAction * action) {}];
        
        [alert addAction:defaultAction];
        [self presentViewController:alert animated:YES completion:nil];
        
    }];

    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
