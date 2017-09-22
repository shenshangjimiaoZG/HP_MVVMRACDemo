#import <Foundation/Foundation.h>
#import <ReactiveObjC/ReactiveObjC.h>

typedef void(^RACBlock)(id result);

@interface LoginViewModel : NSObject

-(RACSignal*)valid:(NSString*)userName withPwd:(NSString*)pwd;

@end
