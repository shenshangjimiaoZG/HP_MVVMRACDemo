#import "UserInfo.h"

@implementation UserInfo
-(NSString *)description
{
    return [NSString stringWithFormat:@"我是%@，密码是%@",_userName,_pwd];
}
@end
