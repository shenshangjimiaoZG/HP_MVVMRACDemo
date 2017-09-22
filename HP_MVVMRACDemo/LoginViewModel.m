#import "LoginViewModel.h"
#import "UserInfo.h"

#define kSuccess @"login success"
#define kError @"看看源码的用户名和密码"


@interface LoginViewModel ()
@property (nonatomic,strong,readwrite)RACSignal *signal;
@end


@implementation LoginViewModel

-(void)loginWithName:(NSString *)userName withPwd:(NSString *)pwd complete:(RACBlock)completeCallback
{
    
    if([userName isEqualToString:@"asap"]&&[pwd isEqualToString:@"123"])
    {
        completeCallback(kSuccess);
    }
    else
    {
        completeCallback(kError);
    }

}
-(RACSignal*)valid:(NSString *)userName withPwd:(NSString *)pwd
{
    
    return [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
        
        [self loginWithName:userName withPwd:pwd complete:^(id result) {
           
            if([result isEqualToString:kSuccess])
            {
                UserInfo *info=[[UserInfo alloc]init];
                info.userName=userName;
                info.pwd=pwd;
                [subscriber sendNext:info.description];
            }
            else
            {
                [subscriber sendNext:kError];
                
            }
            [subscriber sendCompleted];
        }];
        
        return nil;
    }];
           
    
}
@end
