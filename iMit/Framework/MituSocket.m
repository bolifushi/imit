//  MituSocket.m
#import "MituSocket.h"

@implementation MituSocket

//--------------------------------------------------------------//
#pragma mark -- [ Instance method ] --
//--------------------------------------------------------------//
-(void)Connect
{
    [self connectMaintServer];
}

-(void)Disconnect
{
    [self disconnectMituServer];
}

-(void)GetData:(NSString **)data withCommand:(NSString *)command
{
    [self writeData:command];
    *data = [self readData];
}

//--------------------------------------------------------------//
#pragma mark -- Internal method --
//--------------------------------------------------------------//

// MaintServerに接続
-(void)connectMaintServer
{
    struct sockaddr_in server;
    char *deststr;

    @autoreleasepool
    {
        deststr = (char*) [_ipAddress UTF8String];
        
        sock = socket(AF_INET, SOCK_STREAM, 0);
        if((sock = socket(AF_INET, SOCK_STREAM, 0)) < 0) {
            dbgLog(@"エラー  [ socket create ]");
            return;
        }
        
        server.sin_family = AF_INET;
        server.sin_addr.s_addr = inet_addr(deststr);
        server.sin_port = htons(_port);
        server.sin_len = sizeof(server);
        
        if(connect(sock, (struct sockaddr *)&server, sizeof(server)) < 0){
            dbgLog(@"エラー [ socket connect ]");
            return;
        }
    }
}
// MaintServerから切断
-(void)disconnectMituServer{
    close(sock);
}

// 送信
-(void)writeData:(NSString *)data
{
	write(sock, [data UTF8String], [data length]);
}

// 受信
-(NSString *)readData{
    static char buffer[BUFFER_SIZE+1];
	
	int len = read(sock, buffer, BUFFER_SIZE);
	buffer[len] = '\0';

	NSString *request8 = [NSString stringWithCString:buffer encoding:NSShiftJISStringEncoding];
	dbgLog(@"Receive [ %@ ]", request8);
    return request8;
}
@end
