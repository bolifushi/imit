//  MituSocket.h
#import <Foundation/Foundation.h>
#include <netdb.h>

#define BUFFER_SIZE		8192

@interface MituSocket : NSObject
{
    int sock;
    BOOL isConnected;
}

@property (nonatomic, copy) NSString *ipAddress;
@property NSUInteger port;

-(BOOL)Connect;
-(void)Disconnect;
-(void)GetData:(NSString**)data withCommand:(NSString*)command;

@end


