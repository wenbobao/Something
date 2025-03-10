//
//  main.m
//  SocketClient
//
//  Created by apple on 12-3-23.
//  Copyright 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <sys/socket.h>
#import <netinet/in.h>
#import <unistd.h>
#import <arpa/inet.h>

int main (int argc, const char * argv[])
{       
    NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];

    BOOL        success;
    int         err;
    int         fd; 
    struct sockaddr_in addr;
    
    fd = socket(AF_INET, SOCK_STREAM, 0);
    success = (fd != -1);   
    
    if (success) {
        NSLog(@"socket success");
        //配置 socket 的绑定地址
        memset(&addr, 0, sizeof(addr));
        addr.sin_len    = sizeof(addr);
        addr.sin_family = AF_INET;
//        addr.sin_port   = htons(1025);
        addr.sin_addr.s_addr = INADDR_ANY;
        //addr.sin_addr.s_addr = inet_addr("127.0.0.1");
        //addr.sin_addr.s_addr = inet_addr("192.168.80.47");
        //绑定 Socket
        err = bind(fd, (const struct sockaddr *) &addr, sizeof(addr));
        success = (err == 0);
    }
    
    if(success){
        struct sockaddr_in peeraddr;
        memset(&peeraddr, 0, sizeof(peeraddr));
        peeraddr.sin_len    = sizeof(peeraddr);
        peeraddr.sin_family = AF_INET;
        peeraddr.sin_port   = htons(1024);
        peeraddr.sin_addr.s_addr = INADDR_ANY;
        //peeraddr.sin_addr.s_addr = inet_addr("192.168.80.52");
        
        socklen_t addrLen;
        addrLen = sizeof(peeraddr);
        NSLog(@"connecting");
        err = connect(fd, (struct sockaddr *)&peeraddr, addrLen);
        success=(err==0);
        if(success){            
            struct sockaddr_in addr;
            err = getsockname(fd, (struct sockaddr *)&addr, &addrLen);
            success=(err==0);
            if(success){
                NSLog(@"connect success, local address:%s , port:%i",inet_ntoa(addr.sin_addr),ntohs(addr.sin_port));
            }
            if(success){
                char buf[1024];
                do
                {
                    printf("input message:");
                
                    scanf("%s",buf);
                    send(fd, buf, 1024, 0);
                }while(strcmp(buf, "exit")!=0);
            }            
        }
        else{
            NSLog(@"connect failed");
        }        
    }
    
    [pool drain];
    return 0;
}

